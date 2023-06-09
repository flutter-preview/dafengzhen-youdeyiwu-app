import 'dart:convert';

import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// PathApi
class PathApi {
  static Future<PathVo> query(
      {ApiClient? apiClient, String? name = "/"}) async {
    var response =
        await (apiClient ?? ApiClient()).get(Uri.parse("/paths?name=$name"));
    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return PathVo.withDataResponse(decodedResponse);
  }
}
