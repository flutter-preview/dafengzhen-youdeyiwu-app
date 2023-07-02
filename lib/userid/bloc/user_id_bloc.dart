import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_event.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_state.dart';

/// UserIdBloc
class UserIdBloc extends Bloc<UserIdEvent, UserIdState> {
  UserIdBloc() : super(const UserIdState()) {
    on<UpdateDataUserIdEvent>(_updateDataUserIdEvent);
    on<UpdateCurrentSectionUserIdEvent>(_updateCurrentSectionUserIdEvent);
    on<UpdateCurrentTagUserIdEvent>(_updateCurrentTagUserIdEvent);
    on<MergePostDataUserIdEvent>(_mergePostDataUserIdEvent);
    on<UpdateIsLoadingUserIdEvent>(_updateIsLoadingUserIdEvent);
  }

  /// _updateDataUserIdEvent
  void _updateDataUserIdEvent(
    UpdateDataUserIdEvent event,
    Emitter<UserIdState> emit,
  ) {
    emit(state.copyWith(
      details: event.details,
    ));
  }

  /// _updateCurrentSectionUserIdEvent
  void _updateCurrentSectionUserIdEvent(
    UpdateCurrentSectionUserIdEvent event,
    Emitter<UserIdState> emit,
  ) {
    emit(state.copyWith(
      currentSection: event.currentSection,
    ));
  }

  /// _updateCurrentTagUserIdEvent
  void _updateCurrentTagUserIdEvent(
    UpdateCurrentTagUserIdEvent event,
    Emitter<UserIdState> emit,
  ) {
    emit(state.copyWith(
      currentTag: event.currentTag,
    ));
  }

  /// _mergePostDataUserIdEvent
  void _mergePostDataUserIdEvent(
    MergePostDataUserIdEvent event,
    Emitter<UserIdState> emit,
  ) {
    var details = state.details;
    var data = details!.data;
    data.content.addAll(event.details!.data.content);
    data.pageable = event.details!.data.pageable;
    emit(state.copyWith(
      details: details,
    ));
  }

  /// _updateIsLoadingUserIdEvent
  void _updateIsLoadingUserIdEvent(
    UpdateIsLoadingUserIdEvent event,
    Emitter<UserIdState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
