import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/api/comment_api.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/post_api.dart';
import 'package:youdeyiwu_app/api/reply_api.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/model/dto/create_child_reply_dto.dart';
import 'package:youdeyiwu_app/model/dto/create_comment_dto.dart';
import 'package:youdeyiwu_app/model/dto/create_parent_reply_dto.dart';
import 'package:youdeyiwu_app/model/dto/create_reply_dto.dart';
import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_client_vo.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_bloc.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_event.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// PostIdController
class PostIdController {
  final BuildContext context;

  /// PostIdController
  PostIdController({required this.context});

  /// init
  Future<void> init({required String id}) async {
    var apiClient = ApiClient();
    try {
      context.read<PostIdBloc>().add(const UpdateIsLoadingPostIdEvent(true));

      var responses = await Future.wait([
        PathApi.query(apiClient: apiClient),
        PostApi.queryDetails(
          apiClient: apiClient,
          id: int.parse(id),
        ),
      ]);

      var vo = responses[0] as PathVo;
      var detailsVo = responses[1] as PostDetailsClientVo;

      context.read<GlobalBloc>().add(PathGlobalEvent(vo));
      context.read<PostIdBloc>().add(
            UpdateDataPostIdEvent(details: detailsVo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<PostIdBloc>().add(const UpdateIsLoadingPostIdEvent(false));
    }
  }

  /// LoadMoreData
  Future<void> LoadMoreData() async {
    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var id = state.details?.basic.id;
      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      var pageable = state.details?.data.pageable;
      if (pageable == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }
      if (pageable.next == false) {
        return;
      }

      var queryParam = QueryParamDto(
        page: (pageable.page + 1).clamp(1, pageable.pages).toString(),
      );
      var vo = await PostApi.queryDetails(
        apiClient: apiClient,
        id: id,
        queryParam: queryParam,
      );

      context.read<PostIdBloc>().add(
            MergeCommentDataPostIdEvent(details: vo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// loadMoreReplyData
  Future<void> loadMoreReplyData({required int commentId}) async {
    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var element = state.details!.data.content
          .firstWhere((element) => element.comment.id == commentId);
      var pageable = element.pageable;
      if (pageable.next == false) {
        return;
      }

      var queryParam = QueryParamDto(
        page: (pageable.page).clamp(0, pageable.pages).toString(),
      );
      var vo = await ReplyApi.queryAllReplyByCommentId(
        apiClient: apiClient,
        commentId: commentId,
        queryParam: queryParam,
      );

      context.read<PostIdBloc>().add(
            MergeReplyDataPostIdEvent(details: vo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// loadMoreParentReplyData
  Future<void> loadMoreParentReplyData({
    required int commentId,
    required int replyId,
  }) async {
    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var element = state.details!.data.content
          .firstWhere((element) => element.comment.id == commentId)
          .content
          .firstWhere((element) => element.reply.id == replyId);
      var pageable = element.pageable;
      if (pageable.next == false) {
        return;
      }

      var queryParam = QueryParamDto(
        page: (pageable.page).clamp(0, pageable.pages).toString(),
      );
      var vo = await ReplyApi.queryAllParentReplyByReplyId(
        apiClient: apiClient,
        replyId: replyId,
        queryParam: queryParam,
      );

      context.read<PostIdBloc>().add(
            MergeParentReplyDataPostIdEvent(
              details: vo,
              commentId: commentId,
            ),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// loadMoreChildReplyData
  Future<void> loadMoreChildReplyData({
    required int commentId,
    required int replyId,
    required int parentReplyId,
  }) async {
    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var element = state.details!.data.content
          .firstWhere((element) => element.comment.id == commentId)
          .content
          .firstWhere((element) => element.reply.id == replyId)
          .content
          .firstWhere((element) => element.reply.id == parentReplyId);
      var pageable = element.pageable;
      if (pageable.next == false) {
        return;
      }

      var queryParam = QueryParamDto(
        page: (pageable.page).clamp(0, pageable.pages).toString(),
      );
      var vo = await ReplyApi.queryAllChildReplyByParentReplyId(
        apiClient: apiClient,
        replyId: parentReplyId,
        queryParam: queryParam,
      );

      context.read<PostIdBloc>().add(
            MergeChildReplyDataPostIdEvent(
              details: vo,
              commentId: commentId,
              replyId: replyId,
              parentReplyId: parentReplyId,
            ),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// refresh
  Future<void> refresh() async {
    var apiClient = ApiClient();
    try {
      context.read<PostIdBloc>().add(const UpdateIsLoadingPostIdEvent(true));
      var state = context.read<PostIdBloc>().state;
      var id = state.details?.basic.id;
      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      var pageable = state.details!.data.pageable;
      var page = (pageable.page).clamp(0, pageable.pages).toString();
      var vo = await PostApi.queryDetails(
        apiClient: apiClient,
        id: id,
        queryParam: QueryParamDto(
          page: page,
        ),
      );

      context.read<PostIdBloc>().add(
            UpdateDataPostIdEvent(details: vo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<PostIdBloc>().add(const UpdateIsLoadingPostIdEvent(false));
    }
  }

  /// like
  Future<void> like() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var id = state.details?.basic.id;
      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      if (state.details!.isLike == true) {
        await PostApi.cancelLike(
          apiClient: apiClient,
          id: id,
        );
      } else {
        await PostApi.like(
          apiClient: apiClient,
          id: id,
        );
      }

      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.great,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }

  /// follow
  Future<void> follow() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var id = state.details?.basic.id;
      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      if (state.details!.isFollow == true) {
        await Future.wait([
          PostApi.cancelFollow(
            apiClient: apiClient,
            id: id,
          ),
          PostApi.removeFollow(
            apiClient: apiClient,
            id: id,
          ),
        ]);
      } else {
        await Future.wait([
          PostApi.follow(
            apiClient: apiClient,
            id: id,
          ),
          PostApi.createFollow(
            apiClient: apiClient,
            id: id,
          ),
        ]);
      }

      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.great,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }

  /// favourite
  Future<void> favourite() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var id = state.details?.basic.id;
      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      if (state.details!.isFollow == true) {
        await Future.wait([
          PostApi.cancelFavourite(
            apiClient: apiClient,
            id: id,
          ),
          PostApi.removeFavourite(
            apiClient: apiClient,
            id: id,
          ),
        ]);
      } else {
        await Future.wait([
          PostApi.favourite(
            apiClient: apiClient,
            id: id,
          ),
          PostApi.createFavourite(
            apiClient: apiClient,
            id: id,
          ),
        ]);
      }

      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.great,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }

  /// createComment
  Future<void> createComment({required String content}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      var state = context.read<PostIdBloc>().state;
      var id = state.details?.basic.id;
      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      await CommentApi.create(
        apiClient: apiClient,
        dto: CreateCommentDto(postId: id, content: content),
      );
      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.replyFinished,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }

  /// createReply
  Future<void> createReply({
    required int commentId,
    required String content,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      await ReplyApi.create(
        apiClient: apiClient,
        dto: CreateReplyDto(commentId: commentId, content: content),
      );
      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.replyFinished,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }

  /// createParentReply
  Future<void> createParentReply(
      {required int replyId, required String content}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      await ReplyApi.createParentReply(
        apiClient: apiClient,
        dto: CreateParentReplyDto(replyId: replyId, content: content),
      );
      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.replyFinished,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }

  /// createChildReply
  Future<void> createChildReply(
      {required int parentReplyId, required String content}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      await ReplyApi.createChildReply(
        apiClient: apiClient,
        dto:
            CreateChildReplyDto(parentReplyId: parentReplyId, content: content),
      );
      await refresh();

      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.replyFinished,
        type: SnackBarTypeEnum.primary,
      );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }
}
