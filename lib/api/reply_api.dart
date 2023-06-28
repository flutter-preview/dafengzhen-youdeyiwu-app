import 'dart:convert';

import 'package:youdeyiwu_app/model/dto/create_child_reply_dto.dart';
import 'package:youdeyiwu_app/model/dto/create_parent_reply_dto.dart';
import 'package:youdeyiwu_app/model/dto/create_reply_dto.dart';
import 'package:youdeyiwu_app/model/dto/query_param_dto.dart';
import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_parent_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_reply_vo.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// ReplyApi
class ReplyApi {
  /// create
  static Future<void> create({
    ApiClient? apiClient,
    required CreateReplyDto dto,
  }) async {
    await (apiClient ?? ApiClient())
        .post(Uri.parse("/forum/replies"), body: dto);
  }

  /// createParentReply
  static Future<void> createParentReply({
    ApiClient? apiClient,
    required CreateParentReplyDto dto,
  }) async {
    await (apiClient ?? ApiClient())
        .post(Uri.parse("/forum/replies/parent"), body: dto);
  }

  /// createChildReply
  static Future<void> createChildReply({
    ApiClient? apiClient,
    required CreateChildReplyDto dto,
  }) async {
    await (apiClient ?? ApiClient())
        .post(Uri.parse("/forum/replies/child"), body: dto);
  }

  static Future<PostCommentVo> queryAllReplyByCommentId({
    ApiClient? apiClient,
    required int commentId,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/forum/replies/comments/$commentId")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return PostCommentVo.withDataResponse(decodedResponse);
  }

  static Future<PostCommentReplyVo> queryAllParentReplyByReplyId({
    ApiClient? apiClient,
    required int replyId,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/forum/replies/$replyId/parent")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return PostCommentReplyVo.withDataResponse(decodedResponse);
  }

  static Future<PostCommentParentReplyVo> queryAllChildReplyByParentReplyId({
    ApiClient? apiClient,
    required int replyId,
    QueryParamDto? queryParam,
  }) async {
    var uri = Uri.parse("/forum/replies/$replyId/child")
        .replace(queryParameters: queryParam?.toJson());
    var response = await (apiClient ?? ApiClient()).get(uri);
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return PostCommentParentReplyVo.withDataResponse(decodedResponse);
  }
}
