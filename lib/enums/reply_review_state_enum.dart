enum ReplyReviewStateEnum { APPROVED, DENIED, PENDING, CLOSE }

class ReplyReviewState {
  final String value;

  ReplyReviewState(this.value);
}

final replyReviewStateValues = {
  ReplyReviewStateEnum.APPROVED: ReplyReviewState('审核通过'),
  ReplyReviewStateEnum.DENIED: ReplyReviewState('审核不通过'),
  ReplyReviewStateEnum.PENDING: ReplyReviewState('等待审核'),
  ReplyReviewStateEnum.CLOSE: ReplyReviewState('关闭审核'),
};
