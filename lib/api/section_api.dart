import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo_converter.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// SectionApi
class SectionApi {
  static Future<List<SectionClientVo>> queryAll({ApiClient? apiClient}) async {
    var response = await (apiClient ?? ApiClient())
        .get(Uri.parse("/forum/sections/client"));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return DataResponse.fromJson(decodedResponse)
        .data
        .map<SectionClientVo>((e) => SectionClientVo.fromJson(e))
        .toList();
  }

  static Future<SectionDetailsVo> queryDetails({
    ApiClient? apiClient,
    required int id,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/forum/sections/client/$id/details")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return const SectionDetailsVoConverter()
        .fromJson(DataResponse.fromJson(decodedResponse).data);
  }
}
