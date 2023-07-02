import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';

/// UserIdEvent
abstract class UserIdEvent {
  const UserIdEvent();
}

/// UpdateDataUserIdEvent
class UpdateDataUserIdEvent extends UserIdEvent {
  final UserDetailsClientVo? details;

  const UpdateDataUserIdEvent({
    this.details,
  }) : super();
}

/// UpdateCurrentSectionUserIdEvent
class UpdateCurrentSectionUserIdEvent extends UserIdEvent {
  final SectionVo? currentSection;

  const UpdateCurrentSectionUserIdEvent({
    this.currentSection,
  }) : super();
}

/// UpdateCurrentTagUserIdEvent
class UpdateCurrentTagUserIdEvent extends UserIdEvent {
  final TagVo? currentTag;

  const UpdateCurrentTagUserIdEvent({
    this.currentTag,
  }) : super();
}

/// MergePostDataUserIdEvent
class MergePostDataUserIdEvent extends UserIdEvent {
  final UserDetailsClientVo? details;

  const MergePostDataUserIdEvent({
    this.details,
  }) : super();
}

/// UpdateIsLoadingUserIdEvent
class UpdateIsLoadingUserIdEvent extends UserIdEvent {
  final bool isLoading;

  const UpdateIsLoadingUserIdEvent(this.isLoading) : super();
}
