import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

/// HomeState
class HomeState {
  final List<SectionClientVo> sections;
  final PageVo<PostVo>? postData;
  final SectionDetailsVo? sectionData;
  final SectionClientVo? currentSelectedSection;
  final SectionGroupVo? currentSelectedSectionGroup;
  final TagVo? currentSelectedTag;
  final bool? isLoading;
  final bool? searchEnabled;

  /// HomeState
  const HomeState({
    this.sections = const [],
    this.postData,
    this.sectionData,
    this.currentSelectedSection,
    this.currentSelectedSectionGroup,
    this.currentSelectedTag,
    this.isLoading,
    this.searchEnabled,
  });

  /// copyWith
  HomeState copyWith({
    List<SectionClientVo>? sections,
    PageVo<PostVo>? postData,
    SectionDetailsVo? sectionData,
    SectionClientVo? currentSelectedSection,
    SectionGroupVo? currentSelectedSectionGroup,
    TagVo? currentSelectedTag,
    bool? isLoading,
    bool? searchEnabled,
  }) {
    return HomeState(
      sections: sections ?? this.sections,
      postData: postData ?? this.postData,
      sectionData: sectionData ?? this.sectionData,
      currentSelectedSection:
          currentSelectedSection ?? this.currentSelectedSection,
      currentSelectedSectionGroup:
          currentSelectedSectionGroup ?? this.currentSelectedSectionGroup,
      currentSelectedTag: currentSelectedTag ?? this.currentSelectedTag,
      isLoading: isLoading ?? this.isLoading,
      searchEnabled: searchEnabled ?? this.searchEnabled,
    );
  }

  /// updateCurrentSelectedSection
  HomeState updateCurrentSelectedSection(SectionClientVo? vo) {
    return HomeState(
      sections: sections,
      postData: postData,
      sectionData: sectionData,
      currentSelectedSection: vo,
      currentSelectedSectionGroup: currentSelectedSectionGroup,
      currentSelectedTag: currentSelectedTag,
      isLoading: isLoading,
      searchEnabled: searchEnabled,
    );
  }

  /// updateCurrentSelectedSectionGroup
  HomeState updateCurrentSelectedSectionGroup(SectionGroupVo? vo) {
    return HomeState(
      sections: sections,
      postData: postData,
      sectionData: sectionData,
      currentSelectedSection: currentSelectedSection,
      currentSelectedSectionGroup: vo,
      currentSelectedTag: currentSelectedTag,
      isLoading: isLoading,
      searchEnabled: searchEnabled,
    );
  }

  /// updateCurrentSelectedTag
  HomeState updateCurrentSelectedTag(TagVo? vo) {
    return HomeState(
      sections: sections,
      postData: postData,
      sectionData: sectionData,
      currentSelectedSection: currentSelectedSection,
      currentSelectedSectionGroup: currentSelectedSectionGroup,
      currentSelectedTag: vo,
      isLoading: isLoading,
      searchEnabled: searchEnabled,
    );
  }

  /// mergePostData
  HomeState mergePostData(PageVo<PostVo> newData) {
    final List<PostVo> updatedContent = List.from(postData?.content ?? []);
    updatedContent.addAll(newData.content);
    return copyWith(
        postData: PageVo(
      content: updatedContent,
      pageable: newData.pageable,
    ));
  }
}
