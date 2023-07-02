import 'package:youdeyiwu_app/model/vo/path/path_vo.dart';

/// GlobalEvent
abstract class GlobalEvent {
  const GlobalEvent();
}

/// PathGlobalEvent
class PathGlobalEvent extends GlobalEvent {
  final PathVo? path;

  const PathGlobalEvent(this.path) : super();
}
