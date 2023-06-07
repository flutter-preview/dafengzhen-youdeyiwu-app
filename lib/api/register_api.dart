import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/username_register_dto.dart';
import 'package:youdeyiwu_app/model/vo/token_vo.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// RegisterApi
class RegisterApi {
  static Future<TokenVo> usernameRegister(
      {ApiClient? apiClient, required UsernameRegisterDto body}) async {
    var response = await (apiClient ?? ApiClient())
        .post(Uri.parse("/register/username"), body: body);
    var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return TokenVo.withDataResponse(decodedResponse);
  }
}
