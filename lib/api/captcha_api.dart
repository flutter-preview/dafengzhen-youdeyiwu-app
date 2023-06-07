import 'dart:convert';

import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// CaptchaApi
class CaptchaApi {
  static Future<String> generateImageId({ApiClient? apiClient}) async {
    var response =
        await (apiClient ?? ApiClient()).get(Uri.parse("/captcha/image"));
    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    var data =
        DataResponse.fromJson(decodedResponse).data as Map<String, dynamic>;
    return data['id'];
  }
}
