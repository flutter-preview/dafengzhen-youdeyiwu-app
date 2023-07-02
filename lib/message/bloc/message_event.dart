import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';

/// MessageEvent
abstract class MessageEvent {
  const MessageEvent();
}

/// UpdateDataMessageEvent
class UpdateDataMessageEvent extends MessageEvent {
  final UserDetailsClientVo? details;

  const UpdateDataMessageEvent({
    this.details,
  }) : super();
}

/// UpdateIsLoadingMessageEvent
class UpdateIsLoadingMessageEvent extends MessageEvent {
  final bool isLoading;

  const UpdateIsLoadingMessageEvent(this.isLoading) : super();
}
