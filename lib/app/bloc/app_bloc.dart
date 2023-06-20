import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_event.dart';
import 'package:youdeyiwu_app/app/bloc/app_state.dart';

/// AppBloc
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index, currentIndex: event.currentIndex));
    });
  }
}
