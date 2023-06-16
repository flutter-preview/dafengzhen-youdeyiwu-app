import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

/// HomeEvent
abstract class HomeEvent {
  const HomeEvent();
}

/// InitDataHomeEvent
class InitDataHomeEvent extends HomeEvent {
  final List<SectionClientVo> sections;
  final PageVo<PostVo>? postData;
  final SectionDetailsVo? sectionData;

  const InitDataHomeEvent(this.sections, {this.postData, this.sectionData})
      : super();
}

/// UpdateCurrentSelectedSectionHomeEvent
class UpdateCurrentSelectedSectionHomeEvent extends HomeEvent {
  final SectionClientVo? currentSelectedSection;

  const UpdateCurrentSelectedSectionHomeEvent(this.currentSelectedSection)
      : super();
}

/// UpdateCurrentSelectedSectionGroupHomeEvent
class UpdateCurrentSelectedSectionGroupHomeEvent extends HomeEvent {
  final SectionGroupVo? currentSelectedSectionGroup;

  const UpdateCurrentSelectedSectionGroupHomeEvent(
      this.currentSelectedSectionGroup)
      : super();
}

/// UpdateCurrentSelectedTagHomeEvent
class UpdateCurrentSelectedTagHomeEvent extends HomeEvent {
  final TagVo? currentSelectedTag;

  const UpdateCurrentSelectedTagHomeEvent(this.currentSelectedTag) : super();
}

/// UpdateIsLoadingHomeEvent
class UpdateIsLoadingHomeEvent extends HomeEvent {
  final bool isLoading;

  const UpdateIsLoadingHomeEvent(this.isLoading) : super();
}

/// UpdateSearchEnabledHomeEvent
class UpdateSearchEnabledHomeEvent extends HomeEvent {
  final bool searchEnabled;

  const UpdateSearchEnabledHomeEvent(this.searchEnabled) : super();
}

/// MergePostDataHomeEvent
class MergePostDataHomeEvent extends HomeEvent {
  final PageVo<PostVo> postData;

  const MergePostDataHomeEvent(this.postData) : super();
}

/// UpdateDataHomeEvent
class UpdateDataHomeEvent extends HomeEvent {
  final List<SectionClientVo>? sections;
  final PageVo<PostVo>? postData;
  final SectionDetailsVo? sectionData;

  const UpdateDataHomeEvent({this.sections, this.postData, this.sectionData})
      : super();
}
