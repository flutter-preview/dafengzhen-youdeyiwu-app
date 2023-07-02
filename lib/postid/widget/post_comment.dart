import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_controller.dart';
import 'package:youdeyiwu_app/postid/widget/post_reply_dialog.dart';
import 'package:youdeyiwu_app/postid/widget/post_reply_view.dart';
import 'package:youdeyiwu_app/service/security_service.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// buildPostComment
Widget buildPostComment({
  required BuildContext context,
  required PageVo<PostCommentVo> data,
}) {
  List<Widget> children =
      data.content.toList(growable: false).asMap().entries.map((entry) {
    return buildItem(
        context: context, element: entry.value, right: entry.key % 2 != 0);
  }).toList();

  if (children.isNotEmpty) {
    children.add(buildBottomNoMoreDataWidget());
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.elliptical(32.w, 32.h)),
    ),
    child: Column(
      children: children,
    ),
  );
}

/// buildItem
Widget buildItem({
  required BuildContext context,
  required bool right,
  required PostCommentVo element,
}) {
  return Column(
    children: [
      buildUsername(
        context: context,
        user: element.user,
        createdOn: element.comment.createdOn!,
        commentId: element.comment.id,
        right: right,
      ),
      SizedBox(
        height: 16.h,
      ),
      buildContent(
        context: context,
        element: element,
      ),
      SizedBox(
        height: 16.h,
      ),
    ],
  );
}

/// buildUsername
Widget buildUsername({
  required BuildContext context,
  required bool right,
  required UserOvVo user,
  required String createdOn,
  required int commentId,
}) {
  List<Widget> rowChildren = [
    SizedBox(
      width: 56.w,
      height: 56.h,
      child: InkWell(
        onTap: () {
          var id = user.id;
          Navigator.of(context)
              .pushNamed("${AppRoutes.userId}/$id", arguments: {
            "id": id,
          });
        },
        child: CircleAvatar(
          backgroundImage: getUserOvAvatarObject(user: user),
        ),
      ),
    ),
    SizedBox(
      width: 16.w,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment:
            right == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Text(
              user.alias,
            ),
            onTap: () {
              var id = user.id;
              Navigator.of(context)
                  .pushNamed("${AppRoutes.userId}/$id", arguments: {
                "id": id,
              });
            },
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            toRelativeTime(context: context, time: createdOn),
          ),
        ],
      ),
    ),
  ];

  if (right == true) {
    rowChildren = rowChildren.reversed.toList();
  }

  Future<void> onPressed() async {
    try {
      SecurityService.checkUserLogin(context: context);

      String? result = await showDialog(
        context: context,
        builder: (context) =>
            buildPostReplyDialog(context: context, alias: user.alias),
      );

      if (result != null && result.trim().isNotEmpty) {
        PostIdController(context: context)
            .createReply(commentId: commentId, content: result.trim());
      }
    } catch (e) {}
  }

  return Row(
    children: [
      if (!right) ...rowChildren,
      Transform(
        alignment: Alignment.center,
        transform:
            right == true ? Matrix4.rotationY(3.14159) : Matrix4.rotationY(0),
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(BootstrapIcons.reply),
        ),
      ),
      if (right) ...rowChildren,
    ],
  );
}

/// buildContent
Widget buildContent({
  required BuildContext context,
  required PostCommentVo element,
}) {
  return Container(
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.w)),
      color: AppColorsLight.tertiaryBackgroundColor,
    ),
    child: Padding(
      padding: EdgeInsets.all(8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Html(data: element.comment.content),
          ),
          SizedBox(
            height: 16.h,
          ),
          if (element.content.isNotEmpty)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostReplyView(element: element)),
                );
              },
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.showMoreButtonClicked,
                    style: TextStyle(
                      color: AppColorsLight.primaryColor,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColorsLight.primaryColor,
                  ),
                ],
              ),
            ),
        ],
      ),
    ),
  );
}
