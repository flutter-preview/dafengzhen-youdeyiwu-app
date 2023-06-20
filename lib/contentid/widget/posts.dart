import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildPosts({
  required BuildContext context,
  PageVo<PostVo>? postData,
  bool? isLoading,
}) {
  List<Widget> postWidgets = [];
  var content = postData?.content;

  if (content != null) {
    for (var post in content) {
      var overview =
          post.overview ?? AppLocalizations.of(context)!.noDescriptionAvailable;
      List<Widget> detailsChildren = [];
      List<Widget> images = [];

      if (post.details.likeCount > 0) {
        detailsChildren.add(Text("点赞 ${formatCount(post.details.likeCount)}"));
      }
      if (post.details.commentCount > 0) {
        detailsChildren
            .add(Text("评论 ${formatCount(post.details.commentCount)}"));
      }
      if (post.details.replyCount > 0) {
        detailsChildren.add(Text("回复 ${formatCount(post.details.replyCount)}"));
      }

      for (var image in post.images) {
        images.add(ClipRRect(
          borderRadius: BorderRadius.circular(6.w),
          child: Image.network(
            image,
            width: 130.w,
          ),
        ));
      }

      Widget container = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          color: AppColorsLight.tertiaryBackgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: post.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8.w),
                  ),
                  TextSpan(
                    text:
                        "(${toRelativeTime(context: context, time: post.createdOn!)})",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColorsLight.secondaryColor,
                        ),
                  ),
                ]),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  overview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              if (images.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 16.w,
                    children: images,
                  ),
                ),
              if (images.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: const Divider(
                    thickness: 0.1,
                  ),
                ),
              Row(
                children: [
                  SizedBox(
                    width: 56.w,
                    height: 56.h,
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage: getUserOvAvatarObject(
                            user: post.user!, medium: true),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 56.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            post.user!.alias,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (detailsChildren.isNotEmpty)
                          Wrap(
                            spacing: 8.w,
                            children: detailsChildren,
                          ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
      Widget sizedBox = SizedBox(height: 10.h);
      postWidgets.add(container);
      postWidgets.add(sizedBox);
    }

    if (content.isEmpty) {
      postWidgets.add(buildNoMoreDataWidget(context: context, nodata: true));
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppLocalizations.of(context)!.allPost,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      SizedBox(
        height: 8.h,
      ),
      Column(
        children: [
          ...postWidgets,
          if (isLoading == true) buildLoadingIndicator(),
          if (postWidgets.isNotEmpty) buildBottomNoMoreDataWidget(),
        ],
      ),
    ],
  );
}
