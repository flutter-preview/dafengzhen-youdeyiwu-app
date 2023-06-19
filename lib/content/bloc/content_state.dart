import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';

/// ContentState
class ContentState {
  final List<SectionClientVo> sections;

  /// ContentState
  const ContentState({
    this.sections = const [],
  });

  /// copyWith
  ContentState copyWith({
    List<SectionClientVo>? sections,
  }) {
    return ContentState(
      sections: sections ?? this.sections,
    );
  }
}
