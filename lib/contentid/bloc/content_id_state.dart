import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

/// ContentIdState
class ContentIdState {
  final SectionDetailsVo? details;
  final TagVo? currentSelectedTag;
  final bool? isLoading;

  /// ContentIdState
  const ContentIdState({
    this.details,
    this.currentSelectedTag,
    this.isLoading,
  });

  /// copyWith
  ContentIdState copyWith({
    SectionDetailsVo? details,
    TagVo? currentSelectedTag,
    bool? isLoading,
  }) {
    return ContentIdState(
      details: details ?? this.details,
      currentSelectedTag: currentSelectedTag ?? this.currentSelectedTag,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  /// updateCurrentSelectedTag
  ContentIdState updateCurrentSelectedTag(TagVo? vo) {
    return ContentIdState(
      details: details,
      currentSelectedTag: vo,
      isLoading: isLoading,
    );
  }
}
