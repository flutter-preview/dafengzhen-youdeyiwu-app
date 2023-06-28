import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_client_vo.dart';

part 'post_id_state.g.dart';

/// PostIdState
@CopyWith()
class PostIdState {
  final PostDetailsClientVo? details;
  final bool? isLoading;

  /// PostIdState
  const PostIdState({
    this.details,
    this.isLoading,
  });
}
