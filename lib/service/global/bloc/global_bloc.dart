import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_state.dart';

/// GlobalBloc
class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(const GlobalState()) {
    on<PathGlobalEvent>(_pathGlobalEvent);
  }

  void _pathGlobalEvent(PathGlobalEvent event, Emitter<GlobalState> emit) {
    emit(state.copyWith(path: event.path));
  }
}
