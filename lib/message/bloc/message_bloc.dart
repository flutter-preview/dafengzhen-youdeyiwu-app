import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/message/bloc/message_event.dart';
import 'package:youdeyiwu_app/message/bloc/message_state.dart';

/// MessageBloc
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState()) {
    on<UpdateDataMessageEvent>(_updateDataMessageEvent);
    on<UpdateIsLoadingMessageEvent>(_updateIsLoadingMessageEvent);
  }

  /// _updateDataMessageEvent
  void _updateDataMessageEvent(
    UpdateDataMessageEvent event,
    Emitter<MessageState> emit,
  ) {
    emit(state.copyWith(
      details: event.details,
    ));
  }

  /// _updateIsLoadingMessageEvent
  void _updateIsLoadingMessageEvent(
    UpdateIsLoadingMessageEvent event,
    Emitter<MessageState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
