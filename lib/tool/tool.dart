import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/exception/custom_exception.dart';
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
