import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';

/// UserEvent
abstract class UserEvent {
  const UserEvent();
}

/// UpdateDataUserEvent
class UpdateDataUserEvent extends UserEvent {
  final UserDetailsClientVo? details;

  const UpdateDataUserEvent({
    this.details,
  }) : super();
}

/// UpdateCurrentSectionUserEvent
class UpdateCurrentSectionUserEvent extends UserEvent {
  final SectionVo? currentSection;

  const UpdateCurrentSectionUserEvent({
    this.currentSection,
  }) : super();
}

/// UpdateCurrentTagUserEvent
class UpdateCurrentTagUserEvent extends UserEvent {
  final TagVo? currentTag;

  const UpdateCurrentTagUserEvent({
    this.currentTag,
  }) : super();
}

/// MergePostDataUserEvent
class MergePostDataUserEvent extends UserEvent {
  final UserDetailsClientVo? details;

  const MergePostDataUserEvent({
    this.details,
  }) : super();
}

/// UpdateIsLoadingUserEvent
class UpdateIsLoadingUserEvent extends UserEvent {
  final bool isLoading;

  const UpdateIsLoadingUserEvent(this.isLoading) : super();
}
