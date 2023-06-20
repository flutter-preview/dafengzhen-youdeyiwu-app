import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_event.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_state.dart';

/// ContentIdBloc
class ContentIdBloc extends Bloc<ContentIdEvent, ContentIdState> {
  ContentIdBloc() : super(const ContentIdState()) {
    on<UpdateDataContentIdEvent>(_updateDataContentIdEvent);
    on<UpdateCurrentSelectedTagContentIdEvent>(
      _updateCurrentSelectedTagContentIdEvent,
    );
    on<UpdateIsLoadingContentIdEvent>(_updateIsLoadingContentIdEvent);
  }

  /// _updateDataContentIdEvent
  void _updateDataContentIdEvent(
    UpdateDataContentIdEvent event,
    Emitter<ContentIdState> emit,
  ) {
    emit(state.copyWith(
      details: event.details,
    ));
  }

  /// _updateCurrentSelectedTagContentIdEvent
  void _updateCurrentSelectedTagContentIdEvent(
    UpdateCurrentSelectedTagContentIdEvent event,
    Emitter<ContentIdState> emit,
  ) {
    emit(state.updateCurrentSelectedTag(event.currentSelectedTag));
  }

  /// _updateIsLoadingContentIdEvent
  void _updateIsLoadingContentIdEvent(
    UpdateIsLoadingContentIdEvent event,
    Emitter<ContentIdState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
