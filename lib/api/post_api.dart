import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_client_vo_converter.dart';
import 'package:youdeyiwu_app/model/vo/post/post_page_vo_converter.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// PostApi
class PostApi {
  static Future<PageVo<PostVo>> queryAll({
    ApiClient? apiClient,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/forum/posts/client")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return const PostPageVoConverter()
        .fromJson(DataResponse.fromJson(decodedResponse).data);
  }

  static Future<PostDetailsClientVo> queryDetails({
    ApiClient? apiClient,
    required int id,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/forum/posts/client/$id/details")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return const PostDetailsClientVoConverter()
        .fromJson(DataResponse.fromJson(decodedResponse).data);
  }

  static Future<void> like({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient()).get(Uri.parse("/forum/posts/${id}/like"));
  }

  static Future<void> cancelLike({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .delete(Uri.parse("/forum/posts/${id}/like"));
  }

  static Future<void> follow({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .get(Uri.parse("/forum/posts/${id}/follow"));
  }

  static Future<void> cancelFollow({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .delete(Uri.parse("/forum/posts/${id}/follow"));
  }

  static Future<void> removeFollow({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .delete(Uri.parse("/forum/posts/${id}/follow/remove"));
  }

  static Future<void> createFollow({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .post(Uri.parse("/forum/posts/${id}/follow/add"));
  }

  static Future<void> favourite({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .get(Uri.parse("/forum/posts/${id}/favourite"));
  }

  static Future<void> cancelFavourite({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .delete(Uri.parse("/forum/posts/${id}/favourite"));
  }

  static Future<void> removeFavourite({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .delete(Uri.parse("/forum/posts/${id}/favourite/remove"));
  }

  static Future<void> createFavourite({
    ApiClient? apiClient,
    required int id,
  }) async {
    await (apiClient ?? ApiClient())
        .post(Uri.parse("/forum/posts/${id}/favourite/add"));
  }
}
