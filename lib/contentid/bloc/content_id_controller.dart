import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/section_api.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_bloc.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_event.dart';
import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// ContentIdController
class ContentIdController {
  final BuildContext context;

  /// ContentIdController
  ContentIdController({required this.context});

  /// init
  Future<void> init({required String id}) async {
    var apiClient = ApiClient();
    try {
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(true));

      var responses = await Future.wait([
        PathApi.query(apiClient: apiClient),
        SectionApi.queryDetails(
          apiClient: apiClient,
          id: int.parse(id),
        ),
      ]);

      var vo = responses[0] as PathVo;
      var detailsVo = responses[1] as SectionDetailsVo;

      context.read<GlobalBloc>().add(PathGlobalEvent(vo));
      context.read<ContentIdBloc>().add(
            UpdateDataContentIdEvent(details: detailsVo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(false));
    }
  }

  /// updateDataBySectionIdOrTagId
  Future<void> updateDataBySectionIdOrTagId(
      {required int sectionId, int? tagId}) async {
    var apiClient = ApiClient();
    try {
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(true));
      var vo = await SectionApi.queryDetails(
        apiClient: apiClient,
        id: sectionId,
        queryParam: QueryParamDto(tagId: tagId?.toString()),
      );
      context.read<ContentIdBloc>().add(UpdateDataContentIdEvent(details: vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(false));
    }
  }

  /// LoadMoreData
  Future<void> LoadMoreData() async {
    var apiClient = ApiClient();
    try {
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(true));
      var state = context.read<ContentIdBloc>().state;
      var details = state.details;
      var id = details?.basic.id;
      var currentSelectedTag = state.currentSelectedTag;
      var pageable = details?.data.pageable;

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
      if (currentSelectedTag == null) {
        vo = await SectionApi.queryDetails(
          apiClient: apiClient,
          id: id!,
          queryParam: queryParam,
        );
      } else {
        vo = await SectionApi.queryDetails(
          apiClient: apiClient,
          id: id!,
          queryParam:
              queryParam.copyWith(tagId: currentSelectedTag.id.toString()),
        );
      }

      context.read<ContentIdBloc>().add(UpdateDataContentIdEvent(details: vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(false));
    }
  }

  /// refresh
  Future<void> refresh() async {
    var apiClient = ApiClient();
    try {
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(true));
      var state = context.read<ContentIdBloc>().state;
      var id = state.details?.basic.id;

      if (id == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

      var detailsVo = await SectionApi.queryDetails(
        apiClient: apiClient,
        id: id,
      );
      context.read<ContentIdBloc>().add(
            UpdateDataContentIdEvent(details: detailsVo),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context
          .read<ContentIdBloc>()
          .add(const UpdateIsLoadingContentIdEvent(false));
    }
  }
}
