import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo_converter.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// UserApi
class UserApi {
  static Future<UserDetailsClientVo> queryDetails({
    ApiClient? apiClient,
    required int id,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/users/client/$id/details")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return const UserDetailsClientVoConverter()
        .fromJson(DataResponse.fromJson(decodedResponse).data);
  }
}
