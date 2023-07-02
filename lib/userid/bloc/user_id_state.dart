import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';

part 'user_id_state.g.dart';

/// UserIdState
@CopyWith()
class UserIdState {
  final UserDetailsClientVo? details;
  final bool? isLoading;
  final SectionVo? currentSection;
  final TagVo? currentTag;

  /// UserIdState
  const UserIdState({
    this.details,
    this.isLoading,
    this.currentSection,
    this.currentTag,
  });
}
