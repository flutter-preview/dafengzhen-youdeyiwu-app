import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
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
          InkWell(
            child: Text(
              alias,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              if (user != null) {
                var id = user.id;
                Navigator.of(context)
                    .pushNamed("${AppRoutes.userId}/$id", arguments: {
                  "id": id,
                });
              } else {
                Navigator.of(context).pushNamed(AppRoutes.login);
              }
            },
          ),
        ],
      ),
      SizedBox(
        width: 56.w,
        height: 56.h,
        child: InkWell(
          child: CircleAvatar(
            backgroundImage: avatar,
          ),
          onTap: () {
            if (user != null) {
              var id = user.id;
              Navigator.of(context)
                  .pushNamed("${AppRoutes.userId}/$id", arguments: {
                "id": id,
              });
            } else {
              Navigator.of(context).pushNamed(AppRoutes.login);
            }
          },
        ),
      )
    ],
  );
}
