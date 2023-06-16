import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_event.dart';
import 'package:youdeyiwu_app/home/bloc/home_state.dart';

/// HomeBloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<InitDataHomeEvent>(_initDataHomeEvent);
    on<UpdateDataHomeEvent>(_updateDataHomeEvent);
    on<UpdateCurrentSelectedSectionHomeEvent>(
      _updateCurrentSelectedSectionHomeEvent,
    );
    on<UpdateCurrentSelectedSectionGroupHomeEvent>(
      _updateCurrentSelectedSectionGroupHomeEvent,
    );
    on<UpdateCurrentSelectedTagHomeEvent>(
      _updateCurrentSelectedTagHomeEvent,
    );
    on<UpdateIsLoadingHomeEvent>(_updateIsLoadingHomeEvent);
    on<UpdateSearchEnabledHomeEvent>(_updateSearchEnabledHomeEvent);
    on<MergePostDataHomeEvent>(_mergePostDataHomeEvent);
  }

  /// _initDataHomeEvent
  void _initDataHomeEvent(InitDataHomeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      sections: event.sections,
      postData: event.postData,
      sectionData: event.sectionData,
    ));
  }

  /// _updateDataHomeEvent
  void _updateDataHomeEvent(
    UpdateDataHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      sections: event.sections,
      postData: event.postData,
      sectionData: event.sectionData,
    ));
  }

  /// _updateCurrentSelectedSectionHomeEvent
  void _updateCurrentSelectedSectionHomeEvent(
    UpdateCurrentSelectedSectionHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.updateCurrentSelectedSection(event.currentSelectedSection));
  }

  /// _updateCurrentSelectedSectionGroupHomeEvent
  void _updateCurrentSelectedSectionGroupHomeEvent(
    UpdateCurrentSelectedSectionGroupHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state
        .updateCurrentSelectedSectionGroup(event.currentSelectedSectionGroup));
  }

  /// _updateCurrentSelectedTagHomeEvent
  void _updateCurrentSelectedTagHomeEvent(
    UpdateCurrentSelectedTagHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.updateCurrentSelectedTag(event.currentSelectedTag));
  }

  /// _updateIsLoadingHomeEvent
  void _updateIsLoadingHomeEvent(
    UpdateIsLoadingHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  /// _updateSearchEnabledHomeEvent
  void _updateSearchEnabledHomeEvent(
    UpdateSearchEnabledHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(searchEnabled: event.searchEnabled));
  }

  /// _mergePostDataHomeEvent
  void _mergePostDataHomeEvent(
    MergePostDataHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.mergePostData(event.postData));
  }
}
