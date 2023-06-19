import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/section_api.dart';
import 'package:youdeyiwu_app/content/bloc/content_bloc.dart';
import 'package:youdeyiwu_app/content/bloc/content_event.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// ContentController
class ContentController {
  final BuildContext context;

  /// ContentController
  ContentController({required this.context});

  /// init
  Future<void> init() async {
    var apiClient = ApiClient();
    try {
      var responses = await Future.wait([
        PathApi.query(apiClient: apiClient),
        SectionApi.queryAll(apiClient: apiClient),
      ]);

      var vo = responses[0] as PathVo;
      var sections = responses[1] as List<SectionClientVo>;

      context.read<GlobalBloc>().add(PathGlobalEvent(vo));
      context.read<ContentBloc>().add(
            UpdateDataContentEvent(sections: sections),
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
      var sections = await SectionApi.queryAll(apiClient: apiClient);
      context.read<ContentBloc>().add(
            UpdateDataContentEvent(sections: sections),
          );
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }
}
