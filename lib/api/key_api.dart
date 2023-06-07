import 'dart:convert';

import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// KeyApi
class KeyApi {
  static Future<String> queryAccountPublicKey({ApiClient? apiClient}) async {
    var response =
        await (apiClient ?? ApiClient()).get(Uri.parse("/key/public/account"));
    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return DataResponse.fromJson(decodedResponse).data;
  }

  static Future<String> queryPasswordPublicKey({ApiClient? apiClient}) async {
    var response =
        await (apiClient ?? ApiClient()).get(Uri.parse("/key/public/password"));
    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return DataResponse.fromJson(decodedResponse).data;
  }

  static Future<String> queryConfigPublicKey({ApiClient? apiClient}) async {
    var response =
        await (apiClient ?? ApiClient()).get(Uri.parse("/key/public/config"));
    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return DataResponse.fromJson(decodedResponse).data;
  }
}
