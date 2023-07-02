import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/user_api.dart';
import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_bloc.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_event.dart';

/// UserIdController
class UserIdController {
  final BuildContext context;

  /// UserIdController
  UserIdController({required this.context});

  /// init
  Future<void> init({required String id}) async {
    context.read<UserIdBloc>().add(const UpdateIsLoadingUserIdEvent(true));
    var apiClient = ApiClient();

    try {
      var responses = await Future.wait([
        PathApi.query(apiClient: apiClient),
        UserApi.queryDetails(
          apiClient: apiClient,
          id: int.parse(id),
        ),
      ]);

      var vo = responses[0] as PathVo;
      var detailsVo = responses[1] as UserDetailsClientVo;

      context.read<GlobalBloc>().add(PathGlobalEvent(vo));
      context.read<UserIdBloc>().add(
            UpdateDataUserIdEvent(details: detailsVo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<UserIdBloc>().add(const UpdateIsLoadingUserIdEvent(false));
    }
  }

  /// loadPostData
  Future<void> loadPostData(
      {required String id, SectionVo? sectionVo, TagVo? tagVo}) async {
    final apiClient = ApiClient();

    try {
      var dto = QueryParamDto();
      if (sectionVo != null) {
        dto.copyWith(
          sectionId: sectionVo.id.toString(),
        );
      }
      if (tagVo != null) {
        dto.copyWith(
          tagId: tagVo.id.toString(),
        );
      }

      UserDetailsClientVo detailsVo = await UserApi.queryDetails(
        apiClient: apiClient,
        id: int.parse(id),
        queryParam: dto,
      );

      context.read<UserIdBloc>().add(UpdateDataUserIdEvent(details: detailsVo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// LoadMoreData
  Future<void> LoadMoreData() async {
    var apiClient = ApiClient();

    try {
      var state = context.read<UserIdBloc>().state;
      var currentSection = state.currentSection;
      var currentTag = state.currentTag;
      final details = state.details;
      if (details == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      var pageable = details.data.pageable;
      if (pageable.next == false) {
        return;
      }

      var dto = QueryParamDto(
        page: (pageable.page + 1).clamp(1, pageable.pages).toString(),
      );

      if (currentSection != null) {
        dto.copyWith(
          sectionId: currentSection.id.toString(),
        );
      }
      if (currentTag != null) {
        dto.copyWith(
          tagId: currentTag.id.toString(),
        );
      }

      var vo = await UserApi.queryDetails(
        apiClient: apiClient,
        id: details.user.id,
        queryParam: dto,
      );

      context.read<UserIdBloc>().add(MergePostDataUserIdEvent(details: vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }
}
