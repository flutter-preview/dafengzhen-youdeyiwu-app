import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_event.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_constant.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/exception/custom_exception.dart';
import 'package:youdeyiwu_app/model/vo/user/user_avatar_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_vo.dart';
import 'package:youdeyiwu_app/service/global/global_service.dart';

/// showSnackBar
void showSnackBar(
    {required BuildContext context,
    dynamic e,
    dynamic stackTrace,
    SnackBarTypeEnum type = SnackBarTypeEnum.danger,
    Duration? duration}) {
  String message = AppLocalizations.of(context)!.unknownError;
  if (e is CustomException) {
    GlobalService.logger.e('Custom exception', e, stackTrace);
    message = e.message;
  } else {
    GlobalService.logger.e('Unknown exception', e, stackTrace);
    message = e.toString();
  }

  var colorMap = _getSnackBarColor(type);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: colorMap['backgroundColor'],
      content: Text(
        message,
        style: TextStyle(color: colorMap['color']),
      ),
    ),
  );
}

/// getPublicKey
String getPublicKey(String publicKeyString) {
  final stripped = publicKeyString.replaceAll(RegExp(r'\s+'), '');
  final chunks = <String>[];
  for (var i = 0; i < stripped.length; i += 64) {
    chunks.add(stripped.substring(i, i + 64));
  }
  return '-----BEGIN PUBLIC KEY-----\n${chunks.join('\n')}\n-----END PUBLIC KEY-----';
}

/// getCover
String getCover(String cover) {
  final Uri coverUri = Uri.parse(cover);
  if (coverUri.isAbsolute &&
      (coverUri.scheme == 'http' || coverUri.scheme == 'https')) {
    return cover;
  } else {
    return Uri.parse(dotenv.get(AppConstant.appOssServer))
        .resolveUri(coverUri)
        .toString();
  }
}

/// getUserOvAvatar
UserAvatarVo getUserOvAvatar(UserOvVo user) {
  var details = user.details;
  var smallAvatarUrl = details.smallAvatarUrl;
  if (smallAvatarUrl != null) {
    smallAvatarUrl = getCover(smallAvatarUrl);
  }

  var mediumAvatarUrl = details.mediumAvatarUrl;
  if (mediumAvatarUrl != null) {
    mediumAvatarUrl = getCover(mediumAvatarUrl);
  }

  var largeAvatarUrl = details.largeAvatarUrl;
  if (largeAvatarUrl != null) {
    largeAvatarUrl = getCover(largeAvatarUrl);
  }

  return UserAvatarVo().copyWith(
    smallAvatarUrl: smallAvatarUrl,
    mediumAvatarUrl: mediumAvatarUrl,
    largeAvatarUrl: largeAvatarUrl,
  );
}

/// getUserAvatar
UserAvatarVo getUserAvatar(UserVo user) {
  var details = user.details;
  var smallAvatarUrl = details?.smallAvatarUrl;
  if (smallAvatarUrl != null) {
    smallAvatarUrl = getCover(smallAvatarUrl);
  }

  var mediumAvatarUrl = details?.mediumAvatarUrl;
  if (mediumAvatarUrl != null) {
    mediumAvatarUrl = getCover(mediumAvatarUrl);
  }

  var largeAvatarUrl = details?.largeAvatarUrl;
  if (largeAvatarUrl != null) {
    largeAvatarUrl = getCover(largeAvatarUrl);
  }

  return UserAvatarVo().copyWith(
    smallAvatarUrl: smallAvatarUrl,
    mediumAvatarUrl: mediumAvatarUrl,
    largeAvatarUrl: largeAvatarUrl,
  );
}

/// getUserOvAvatarObject
ImageProvider<Object> getUserOvAvatarObject(
    {required UserOvVo user, bool? small, bool? medium, bool? large}) {
  var userOvAvatar = getUserOvAvatar(user);
  String? avatarUrl;

  if (small ?? false) {
    avatarUrl = userOvAvatar.smallAvatarUrl;
  } else if (medium ?? false) {
    avatarUrl = userOvAvatar.mediumAvatarUrl;
  } else if (large ?? false) {
    avatarUrl = userOvAvatar.largeAvatarUrl;
  }

  if (avatarUrl != null) {
    return NetworkImage(avatarUrl);
  }

  return getDefaultUserAvatarObject();
}

/// getDefaultUserAvatarObject
ImageProvider<Object> getDefaultUserAvatarObject() {
  return const AssetImage("assets/images/avatar.png");
}

/// formatCount
String formatCount(int count) {
  if (count < 1000) {
    return count.toString();
  }

  String suffix = '';
  double divisor = 1;

  if (count >= 1000000000) {
    suffix = 'B';
    divisor = 1000000000;
  } else if (count >= 1000000) {
    suffix = 'M';
    divisor = 1000000;
  } else if (count >= 1000) {
    suffix = 'K';
    divisor = 1000;
  }

  return (count / divisor).toStringAsFixed(1) + suffix;
}

/// toRelativeTime
String toRelativeTime({required BuildContext context, required String time}) {
  final currentTime = DateTime.now();
  final parsedTime = DateTime.parse(time);
  final diff = currentTime.difference(parsedTime);

  if (diff.inSeconds < 60) {
    return '${diff.inSeconds} ${AppLocalizations.of(context)!.secondsAgo}';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} ${AppLocalizations.of(context)!.minutesAgo}';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} ${AppLocalizations.of(context)!.hoursAgo}';
  } else {
    return "${diff.inDays} ${AppLocalizations.of(context)!.daysAgo}";
  }
}

/// formatDateTime
String formatDateTime(String date, {bool? ymd}) {
  return DateFormat(ymd == true ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm:ss")
      .format(DateTime.parse(date));
}

/// buildNoMoreDataWidget
Widget buildNoMoreDataWidget({required BuildContext context, bool? nodata}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.w),
      color: AppColorsLight.tertiaryBackgroundColor,
    ),
    child: Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                nodata == true
                    ? AppLocalizations.of(context)!.noData
                    : AppLocalizations.of(context)!.noMoreData,
                style: const TextStyle(color: AppColorsLight.tertiaryColor),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

/// buildLoadingIndicator
Widget buildLoadingIndicator() {
  return Padding(
    padding: EdgeInsets.all(16.w),
    child: const Center(child: CircularProgressIndicator()),
  );
}

/// buildBottomNoMoreDataWidget
Widget buildBottomNoMoreDataWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Divider(
          color: AppColorsLight.borderColor,
          thickness: 0.3,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: const Text(
          AppConstant.endText,
          style: TextStyle(
            color: AppColorsLight.borderColor,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: AppColorsLight.borderColor,
          thickness: 0.3,
        ),
      ),
    ],
  );
}

/// buildBottomNavigationBar
Widget buildBottomNavigationBar(
    {required BuildContext context, bool? isOnTap}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 1,
          color: Colors.grey.withOpacity(0.1),
        )
      ],
    ),
    child: BottomNavigationBar(
      currentIndex: context.read<AppBloc>().state.currentIndex,
      onTap: (value) {
        context.read<AppBloc>().add(TriggerAppEvent(value, value));
        if (isOnTap == true) {
          if (value == 0) {
            Navigator.of(context).pushNamed(AppRoutes.root);
          } else if (value == 1) {
            Navigator.of(context).pushNamed(AppRoutes.content);
          } else if (value == 2) {
            Navigator.of(context).pushNamed(AppRoutes.message);
          } else if (value == 3) {
            Navigator.of(context).pushNamed(AppRoutes.user);
          }
        }
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          label: "首页",
          icon: SizedBox(
            child: Icon(BootstrapIcons.house),
          ),
          activeIcon: SizedBox(
            child: Icon(BootstrapIcons.house_fill),
          ),
        ),
        BottomNavigationBarItem(
          label: "内容",
          icon: SizedBox(
            child: Icon(BootstrapIcons.card_text),
          ),
          activeIcon: SizedBox(
            child: Icon(BootstrapIcons.card_heading),
          ),
        ),
        BottomNavigationBarItem(
          label: "消息",
          icon: SizedBox(
            child: Icon(BootstrapIcons.bell),
          ),
          activeIcon: SizedBox(
            child: Icon(BootstrapIcons.bell_fill),
          ),
        ),
        BottomNavigationBarItem(
          label: "用户",
          icon: SizedBox(
            child: Icon(BootstrapIcons.person),
          ),
          activeIcon: SizedBox(
            child: Icon(BootstrapIcons.person_fill),
          ),
        ),
      ],
    ),
  );
}

/// _getSnackBarColor
Map<String, Color> _getSnackBarColor(SnackBarTypeEnum type) {
  switch (type) {
    case SnackBarTypeEnum.success:
      return {
        "color": AppColorsLight.alertSuccessColor,
        "backgroundColor": AppColorsLight.alertSuccessBackgroundColor,
      };
    case SnackBarTypeEnum.primary:
      return {
        "color": AppColorsLight.alertPrimaryColor,
        "backgroundColor": AppColorsLight.alertPrimaryBackgroundColor,
      };
    case SnackBarTypeEnum.warning:
      return {
        "color": AppColorsLight.alertWarningColor,
        "backgroundColor": AppColorsLight.alertWarningBackgroundColor,
      };
    case SnackBarTypeEnum.danger:
    default:
      return {
        "color": AppColorsLight.alertDangerColor,
        "backgroundColor": AppColorsLight.alertDangerBackgroundColor,
      };
  }
}
