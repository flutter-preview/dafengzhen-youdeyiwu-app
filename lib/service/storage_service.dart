import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youdeyiwu_app/constants/app_constant.dart';
import 'package:youdeyiwu_app/model/vo/token_vo.dart';

/// StorageService
class StorageService {
  late final SharedPreferences _sharedPreferences;

  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }

  Future<void> setTokenVo(TokenVo value) async {
    await setString(AppConstant.tokenVoStorage, jsonEncode(value));
  }

  TokenVo? getTokenVo() {
    var value = _sharedPreferences.getString(AppConstant.tokenVoStorage) ?? "";
    if (value.isNotEmpty) {
      return TokenVo.fromJson(jsonDecode(value));
    }
    return null;
  }

  Future<void> removeTokenVo() async {
    await remove(AppConstant.tokenVoStorage);
  }
}
