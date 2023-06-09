import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';

/// GlobalState
class GlobalState {
  final PathVo? path;

  const GlobalState({this.path});

  GlobalState copyWith({
    PathVo? path,
  }) {
    return GlobalState(
      path: path ?? this.path,
    );
  }
}
