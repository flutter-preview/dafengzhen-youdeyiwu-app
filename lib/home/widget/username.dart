import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildUsername({required BuildContext context}) {
  var user = context.read<GlobalBloc>().state.path?.user;
  var alias = AppLocalizations.of(context)!.anonymousUsername;
  var avatar = getDefaultUserAvatarObject();
  if (user != null) {
    alias = user.alias;
    avatar = getUserOvAvatarObject(user: user);
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.hello,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            alias,
            style: Theme.of(context).textTheme.titleMedium,
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
