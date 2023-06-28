import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/constants/app_constant.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_controller.dart';
import 'package:youdeyiwu_app/postid/widget/post_reply_dialog.dart';
import 'package:youdeyiwu_app/service/security_service.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildPostButton({
  required BuildContext context,
  required PostVo basic,
  required PostDetailsVo details,
  required String alias,
  bool? isLike,
  bool? isFollow,
  bool? isFavourite,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Badge(
            isLabelVisible: details.commentCount > 0,
            label: Text(formatCount(details.commentCount)),
            largeSize: 20,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(fontSize: 14.sp),
            child: ElevatedButton.icon(
              onPressed: () async {
                try {
                  SecurityService.checkUserLogin(context: context);

                  String? result = await showDialog(
                    context: context,
                    builder: (context) =>
                        buildPostReplyDialog(context: context, alias: alias),
                  );

                  if (result != null && result.trim().isNotEmpty) {
                    PostIdController(context: context)
                        .createComment(content: result.trim());
                  }
                } catch (e) {}
              },
              icon: Icon(BootstrapIcons.reply),
              label: Text(AppLocalizations.of(context)!.comment),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Badge(
            isLabelVisible: details.likeCount > 0,
            label: Text(formatCount(details.likeCount)),
            largeSize: 20,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(fontSize: 14.sp),
            child: ElevatedButton.icon(
              onPressed: () {
                try {
                  SecurityService.checkUserLogin(context: context);
                  PostIdController(context: context).like();
                } catch (e) {}
              },
              icon: isLike == true
                  ? const Icon(BootstrapIcons.hand_thumbs_up_fill)
                  : const Icon(BootstrapIcons.hand_thumbs_up),
              label: Text(AppLocalizations.of(context)!.like),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Badge(
            isLabelVisible: details.followCount > 0,
            label: Text(formatCount(details.followCount)),
            largeSize: 20,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(fontSize: 14.sp),
            child: ElevatedButton.icon(
              onPressed: () {
                try {
                  SecurityService.checkUserLogin(context: context);
                  PostIdController(context: context).follow();
                } catch (e) {}
              },
              icon: isFollow == true
                  ? const Icon(BootstrapIcons.bell_fill)
                  : const Icon(BootstrapIcons.bell),
              label: Text(AppLocalizations.of(context)!.follow),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 8.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              var text =
                  "[${basic.name}](${dotenv.get(AppConstant.appUrl)}/posts/${basic.id})";
              Clipboard.setData(ClipboardData(text: text));
              showSnackBar(
                context: context,
                e: AppLocalizations.of(context)!.clipboardText,
                type: SnackBarTypeEnum.primary,
              );
            },
            icon: Icon(BootstrapIcons.share),
            label: Text(AppLocalizations.of(context)!.share),
          ),
          SizedBox(
            width: 24.w,
          ),
          Badge(
            isLabelVisible: details.favoriteCount > 0,
            label: Text(formatCount(details.favoriteCount)),
            largeSize: 20,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(fontSize: 14.sp),
            child: ElevatedButton.icon(
              onPressed: () {
                try {
                  SecurityService.checkUserLogin(context: context);
                  PostIdController(context: context).favourite();
                } catch (e) {}
              },
              icon: isFavourite == true
                  ? const Icon(BootstrapIcons.star_fill)
                  : const Icon(BootstrapIcons.star),
              label: Text(AppLocalizations.of(context)!.favorite),
            ),
          ),
        ],
      ),
    ],
  );
}
