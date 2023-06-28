import 'package:youdeyiwu_app/model/dto/create_comment_dto.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';

/// CommentApi
class CommentApi {
  static Future<void> create({
    ApiClient? apiClient,
    required CreateCommentDto dto,
  }) async {
    await (apiClient ?? ApiClient())
        .post(Uri.parse("/forum/comments"), body: dto);
  }
}
