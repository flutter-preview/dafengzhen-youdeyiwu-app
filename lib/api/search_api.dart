import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_page_vo_converter.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// SearchApi
class SearchApi {
  static Future<PageVo<PostVo>> searchPost(
      {ApiClient? apiClient,
      required String name,
      QueryParamDto? queryParam}) async {
    if (name.contains('*') == false) {
      name = "*$name*";
    }

    var uri = Uri.parse("/search")
        .replace(queryParameters: {...?queryParam?.toJson(), "name": name});
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return const PostPageVoConverter()
        .fromJson(DataResponse.fromJson(decodedResponse).data);
  }
}
