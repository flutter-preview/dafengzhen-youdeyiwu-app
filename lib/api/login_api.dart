import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/username_login_dto.dart';
import 'package:youdeyiwu_app/model/vo/token_vo.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// LoginApi
class LoginApi {
  static Future<TokenVo> usernameLogin(
      {ApiClient? apiClient, required UsernameLoginDto body}) async {
    var response = await (apiClient ?? ApiClient())
        .post(Uri.parse("/login/username"), body: body);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return TokenVo.withDataResponse(decodedResponse);
  }

  static Future<void> logout({ApiClient? apiClient}) async {
    await (apiClient ?? ApiClient()).get(Uri.parse("/logout"));
  }
}
