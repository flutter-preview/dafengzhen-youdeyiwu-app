import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/content/bloc/content_event.dart';
import 'package:youdeyiwu_app/content/bloc/content_state.dart';

/// ContentBloc
class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(const ContentState()) {
    on<UpdateDataContentEvent>(_updateDataContentEvent);
  }

  /// _updateDataContentEvent
  void _updateDataContentEvent(
    UpdateDataContentEvent event,
    Emitter<ContentState> emit,
  ) {
    emit(state.copyWith(
      sections: event.sections,
    ));
  }
}
