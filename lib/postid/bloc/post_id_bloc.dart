import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_event.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_state.dart';

/// PostIdBloc
class PostIdBloc extends Bloc<PostIdEvent, PostIdState> {
  PostIdBloc() : super(const PostIdState()) {
    on<UpdateDataPostIdEvent>(_updateDataPostIdEvent);
    on<MergeCommentDataPostIdEvent>(_mergeCommentDataPostIdEvent);
    on<MergeReplyDataPostIdEvent>(_mergeReplyDataPostIdEvent);
    on<MergeParentReplyDataPostIdEvent>(_mergeParentReplyDataPostIdEvent);
    on<MergeChildReplyDataPostIdEvent>(_mergeChildReplyDataPostIdEvent);
    on<UpdateIsLoadingPostIdEvent>(_updateIsLoadingPostIdEvent);
  }

  /// _updateDataPostIdEvent
  void _updateDataPostIdEvent(
    UpdateDataPostIdEvent event,
    Emitter<PostIdState> emit,
  ) {
    emit(state.copyWith(
      details: event.details,
    ));
  }

  /// _mergeCommentDataPostIdEvent
  void _mergeCommentDataPostIdEvent(
    MergeCommentDataPostIdEvent event,
    Emitter<PostIdState> emit,
  ) {
    var details = state.details;
    var data = details!.data;
    data.content.addAll(event.details!.data.content);
    data.pageable = event.details!.data.pageable;
    emit(state.copyWith(
      details: details,
    ));
  }

  /// _mergeReplyDataPostIdEvent
  void _mergeReplyDataPostIdEvent(
    MergeReplyDataPostIdEvent event,
    Emitter<PostIdState> emit,
  ) {
    var details = state.details;
    var data = details!.data;
    var element = data.content.firstWhere(
        (element) => element.comment.id == event.details.comment.id);

    for (var item in event.details.content) {
      if (!element.content.contains(item)) {
        element.content.add(item);
      }
    }
    element.pageable = event.details.pageable;

    emit(state.copyWith(
      details: details,
    ));
  }

  /// _mergeParentReplyDataPostIdEvent
  void _mergeParentReplyDataPostIdEvent(
    MergeParentReplyDataPostIdEvent event,
    Emitter<PostIdState> emit,
  ) {
    var details = state.details;
    var data = details!.data;
    var element = data.content
        .firstWhere((element) => element.comment.id == event.commentId)
        .content
        .firstWhere((element) => element.reply.id == event.details.reply.id);

    for (var item in event.details.content) {
      if (!element.content.contains(item)) {
        element.content.add(item);
      }
    }
    element.pageable = event.details.pageable;

    emit(state.copyWith(
      details: details,
    ));
  }

  /// _mergeChildReplyDataPostIdEvent
  void _mergeChildReplyDataPostIdEvent(
    MergeChildReplyDataPostIdEvent event,
    Emitter<PostIdState> emit,
  ) {
    var details = state.details;
    var data = details!.data;
    var element = data.content
        .firstWhere((element) => element.comment.id == event.commentId)
        .content
        .firstWhere((element) => element.reply.id == event.replyId)
        .content
        .firstWhere((element) => element.reply.id == event.parentReplyId);

    for (var item in event.details.content) {
      if (!element.content.contains(item)) {
        element.content.add(item);
      }
    }
    element.pageable = event.details.pageable;

    emit(state.copyWith(
      details: details,
    ));
  }

  /// _updateIsLoadingPostIdEvent
  void _updateIsLoadingPostIdEvent(
    UpdateIsLoadingPostIdEvent event,
    Emitter<PostIdState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
