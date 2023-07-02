import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';

part 'global_state.g.dart';

/// GlobalState
@CopyWith()
class GlobalState {
  final PathVo? path;

  const GlobalState({this.path});
}
