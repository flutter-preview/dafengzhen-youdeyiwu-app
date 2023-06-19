import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';

/// ContentEvent
abstract class ContentEvent {
  const ContentEvent();
}

/// UpdateDataContentEvent
class UpdateDataContentEvent extends ContentEvent {
  final List<SectionClientVo>? sections;

  const UpdateDataContentEvent({
    this.sections,
  }) : super();
}
