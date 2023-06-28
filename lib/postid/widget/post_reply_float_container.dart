import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_controller.dart';
import 'package:youdeyiwu_app/service/security_service.dart';

Widget buildPostReplyFloatContainer({
  required BuildContext context,
  required TextEditingController textEditingController,
  String? hintText,
  int? commentId,
  int? replyId,
  int? parentReplyId,
}) {
  return Positioned(
    bottom: 20.h,
    left: 0,
    right: 0,
    child: Container(
      decoration: BoxDecoration(
        color: AppColorsLight.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(40.w),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText != null
                    ? "${AppLocalizations.of(context)!.reply} ${hintText}"
                    : AppLocalizations.of(context)!.userInput,
                hintStyle: const TextStyle(
                  color: AppColorsLight.tertiaryColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            icon: const Icon(BootstrapIcons.send),
            onPressed: () async {
              try {
                SecurityService.checkUserLogin(context: context);
                var value = textEditingController.text.trim();
                if (value.isNotEmpty) {
                  if (commentId != null) {
                    PostIdController(context: context)
                        .createReply(commentId: commentId, content: value);
                  }

                  if (replyId != null) {
                    PostIdController(context: context)
                        .createParentReply(replyId: replyId, content: value);
                  }

                  if (parentReplyId != null) {
                    PostIdController(context: context).createChildReply(
                        parentReplyId: parentReplyId, content: value);
                  }
                }
              } finally {
                textEditingController.clear();
              }
            },
          ),
        ],
      ),
    ),
  );
}
