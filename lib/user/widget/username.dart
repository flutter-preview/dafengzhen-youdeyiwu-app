import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildUsername(
    {required BuildContext context, UserOvVo? user, bool? isUserId}) {
  var currentUser = user ?? context.read<GlobalBloc>().state.path?.user;
  var alias = AppLocalizations.of(context)!.anonymousUsername;
  var avatar = getDefaultUserAvatarObject();
  if (currentUser != null) {
    alias = currentUser.alias;
    avatar = getUserOvAvatarObject(user: currentUser);
  }

  if (isUserId == true) {
    return Column(
      children: [
        SizedBox(
          width: 56.w,
          height: 56.h,
          child: CircleAvatar(
            backgroundImage: avatar,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          alias,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            alias,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      SizedBox(
        width: 56.w,
        height: 56.h,
        child: CircleAvatar(
          backgroundImage: avatar,
        ),
      )
    ],
  );
}
