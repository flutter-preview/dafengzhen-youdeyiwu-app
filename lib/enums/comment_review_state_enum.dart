enum CommentReviewStateEnum { APPROVED, DENIED, PENDING, CLOSE }

class CommentReviewState {
  final String value;

  CommentReviewState(this.value);
}

final commentReviewStateValues = {
  CommentReviewStateEnum.APPROVED: CommentReviewState('审核通过'),
  CommentReviewStateEnum.DENIED: CommentReviewState('审核不通过'),
  CommentReviewStateEnum.PENDING: CommentReviewState('等待审核'),
  CommentReviewStateEnum.CLOSE: CommentReviewState('关闭审核'),
};
