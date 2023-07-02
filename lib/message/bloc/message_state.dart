import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';

part 'message_state.g.dart';

/// MessageState
@CopyWith()
class MessageState {
  final UserDetailsClientVo? details;
  final bool? isLoading;

  /// MessageState
  const MessageState({
    this.details,
    this.isLoading,
  });
}
