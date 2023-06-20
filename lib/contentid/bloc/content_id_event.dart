import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

/// ContentIdEvent
abstract class ContentIdEvent {
  const ContentIdEvent();
}

/// UpdateDataContentIdEvent
class UpdateDataContentIdEvent extends ContentIdEvent {
  final SectionDetailsVo? details;

  const UpdateDataContentIdEvent({
    this.details,
  }) : super();
}

/// UpdateCurrentSelectedTagContentIdEvent
class UpdateCurrentSelectedTagContentIdEvent extends ContentIdEvent {
  final TagVo? currentSelectedTag;

  const UpdateCurrentSelectedTagContentIdEvent(this.currentSelectedTag)
      : super();
}

/// UpdateIsLoadingContentIdEvent
class UpdateIsLoadingContentIdEvent extends ContentIdEvent {
  final bool isLoading;

  const UpdateIsLoadingContentIdEvent(this.isLoading) : super();
}
