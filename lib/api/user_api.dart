import 'dart:convert';

import 'package:youdeyiwu_app/model/user_model.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

class UserApi {
  static login({UserLoginResponseModel? params}) async {
    var client = ApiClient();
    try {
      var response = await ApiClient().post(
          Uri.https('example.com', 'whatsit/create'),
          body: {'name': 'doodle', 'color': 'blue'});
      var decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      print(decodedResponse);
      return UserLoginResponseModel.fromJson(decodedResponse);
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }
}
