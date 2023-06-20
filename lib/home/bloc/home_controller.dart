import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/post_api.dart';
import 'package:youdeyiwu_app/api/search_api.dart';
import 'package:youdeyiwu_app/api/section_api.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_event.dart';
import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// HomeController
class HomeController {
  final BuildContext context;

  /// HomeController
  HomeController({required this.context});

  /// init
  Future<void> init() async {
    var apiClient = ApiClient();
    try {
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(true));
      var responses = await Future.wait([
        PathApi.query(apiClient: apiClient),
        SectionApi.queryAll(apiClient: apiClient),
        PostApi.queryAll(apiClient: apiClient)
      ]);

      var vo = responses[0] as PathVo;
      var sections = responses[1] as List<SectionClientVo>;
      var postData = responses[2] as PageVo<PostVo>;

      context.read<GlobalBloc>().add(PathGlobalEvent(vo));
      context.read<HomeBloc>().add(
            InitDataHomeEvent(sections, postData: postData),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(false));
    }
  }

  /// updatePostData
  Future<void> updatePostData() async {
    var apiClient = ApiClient();
    try {
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(true));
      var vo = await PostApi.queryAll(apiClient: apiClient);
      context.read<HomeBloc>().add(UpdateDataHomeEvent(postData: vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(false));
    }
  }

  /// updatePostDataBySectionIdOrTagId
  Future<void> updatePostDataBySectionIdOrTagId(
      {required int sectionId, int? tagId}) async {
    var apiClient = ApiClient();
    try {
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(true));
      var vo = await SectionApi.queryDetails(
        apiClient: apiClient,
        id: sectionId,
        queryParam: QueryParamDto(tagId: tagId?.toString()),
      );
      context.read<HomeBloc>().add(UpdateDataHomeEvent(postData: vo.data));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(false));
    }
  }

  /// searchPostDataByName
  Future<void> searchPostDataByName({required String name}) async {
    var apiClient = ApiClient();
    try {
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(true));
      var vo = await SearchApi.searchPost(apiClient: apiClient, name: name);
      context.read<HomeBloc>().add(UpdateDataHomeEvent(postData: vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(false));
    }
  }

  /// LoadMorePostData
  Future<void> LoadMorePostData({String? name}) async {
    var apiClient = ApiClient();
    try {
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(true));
      var state = context.read<HomeBloc>().state;
      var searchEnabled = state.searchEnabled;
      var currentSelectedSection = state.currentSelectedSection;
      var pageable = state.postData?.pageable;

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
      var vo;

      if (searchEnabled == true && name != null && name.isNotEmpty) {
        vo = await SearchApi.searchPost(apiClient: apiClient, name: name);
      } else if (currentSelectedSection == null) {
        vo = await PostApi.queryAll(
          apiClient: apiClient,
          queryParam: queryParam,
        );
      } else {
        vo = await SectionApi.queryDetails(
          apiClient: apiClient,
          id: currentSelectedSection.id,
          queryParam: queryParam,
        );
      }

      context.read<HomeBloc>().add(MergePostDataHomeEvent(vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<HomeBloc>().add(const UpdateIsLoadingHomeEvent(false));
    }
  }
}
