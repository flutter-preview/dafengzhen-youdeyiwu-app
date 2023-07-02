import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/api/login_api.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/user_api.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/service/global/global_service.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';
import 'package:youdeyiwu_app/user/bloc/user_bloc.dart';
import 'package:youdeyiwu_app/user/bloc/user_event.dart';

/// UserController
class UserController {
  final BuildContext context;

  /// UserController
  UserController({required this.context});

  /// init
  Future<void> init() async {
    context.read<UserBloc>().add(const UpdateIsLoadingUserEvent(true));
    final apiClient = ApiClient();

    try {
      final path = context.read<GlobalBloc>().state.path;
      final futures = <Future<dynamic>>[PathApi.query(apiClient: apiClient)];
      UserDetailsClientVo? detailsVo;

      if (path != null && path.user != null) {
        futures.add(UserApi.queryDetails(
          apiClient: apiClient,
          id: path.user!.id,
        ));
      }

      final responses = await Future.wait(futures);
      final vo = responses[0] as PathVo;

      if (responses.length > 1) {
        detailsVo = responses[1] as UserDetailsClientVo;
      }

      _updateData(vo, detailsVo);
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      context.read<UserBloc>().add(const UpdateIsLoadingUserEvent(false));
    }
  }

  /// loadPostData
  Future<void> loadPostData({SectionVo? sectionVo, TagVo? tagVo}) async {
    final apiClient = ApiClient();

    try {
      final path = context.read<GlobalBloc>().state.path;
      if (path == null || path.user == null) {
        showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.dataNotFound,
        );
        return;
      }

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
        id: path.user!.id,
        queryParam: dto,
      );

      context.read<UserBloc>().add(UpdateDataUserEvent(details: detailsVo));
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
      var state = context.read<UserBloc>().state;
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

      context.read<UserBloc>().add(MergePostDataUserEvent(details: vo));
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// logout
  Future<void> logout() async {
    final apiClient = ApiClient();
    try {
      await LoginApi.logout();
      await GlobalService.storageService.removeTokenVo();
      context.read<GlobalBloc>().add(const PathGlobalEvent(null));

      showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.isLogoutCompleted,
          type: SnackBarTypeEnum.success,
          duration: Duration(milliseconds: 1000));

      showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.reloadingSoon,
          type: SnackBarTypeEnum.primary,
          duration: Duration(milliseconds: 1200));

      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.root,
          (route) => false,
        );
      });
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  /// _updateData
  void _updateData(PathVo vo, UserDetailsClientVo? detailsVo) {
    final userBloc = context.read<UserBloc>();
    final globalBloc = context.read<GlobalBloc>();

    if (detailsVo != null) {
      userBloc.add(UpdateDataUserEvent(details: detailsVo));
    }

    globalBloc.add(PathGlobalEvent(vo));
  }
}
