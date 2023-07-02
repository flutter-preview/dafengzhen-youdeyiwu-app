import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum PostContentTypeEnum {
  DEFAULT,
  LINK,
  NONE,
}

class PostContentType {
  static String getValue(
      BuildContext context, PostContentTypeEnum contentType) {
    switch (contentType) {
      case PostContentTypeEnum.DEFAULT:
        return AppLocalizations.of(context)!.defaultText;
      case PostContentTypeEnum.LINK:
        return AppLocalizations.of(context)!.link;
      case PostContentTypeEnum.NONE:
        return AppLocalizations.of(context)!.noContent;
      default:
        throw ArgumentError("Unknown content type: $contentType");
    }
  }
}
