import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/user/bloc/user_event.dart';
import 'package:youdeyiwu_app/user/bloc/user_state.dart';

/// UserBloc
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<UpdateDataUserEvent>(_updateDataUserEvent);
    on<UpdateCurrentSectionUserEvent>(_updateCurrentSectionUserEvent);
    on<UpdateCurrentTagUserEvent>(_updateCurrentTagUserEvent);
    on<MergePostDataUserEvent>(_mergePostDataUserEvent);
    on<UpdateIsLoadingUserEvent>(_updateIsLoadingUserEvent);
  }

  /// _updateDataUserEvent
  void _updateDataUserEvent(
    UpdateDataUserEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
      details: event.details,
    ));
  }

  /// _updateCurrentSectionUserEvent
  void _updateCurrentSectionUserEvent(
    UpdateCurrentSectionUserEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
      currentSection: event.currentSection,
    ));
  }

  /// _updateCurrentTagUserEvent
  void _updateCurrentTagUserEvent(
    UpdateCurrentTagUserEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
      currentTag: event.currentTag,
    ));
  }

  /// _mergePostDataUserEvent
  void _mergePostDataUserEvent(
    MergePostDataUserEvent event,
    Emitter<UserState> emit,
  ) {
    var details = state.details;
    var data = details!.data;
    data.content.addAll(event.details!.data.content);
    data.pageable = event.details!.data.pageable;
    emit(state.copyWith(
      details: details,
    ));
  }

  /// _updateIsLoadingUserEvent
  void _updateIsLoadingUserEvent(
    UpdateIsLoadingUserEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
