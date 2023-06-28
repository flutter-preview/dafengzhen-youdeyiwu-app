import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';

Widget buildPostReplyDialog(
    {required BuildContext context, required String alias}) {
  String newValue = "";
  return AlertDialog(
    title: Text("${AppLocalizations.of(context)!.reply} $alias"),
    content: TextField(
      autofocus: true,
      maxLines: 4,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.userInput,
        hintStyle: const TextStyle(color: AppColorsLight.tertiaryColor),
      ),
      onChanged: (value) {
        newValue = value;
      },
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(AppLocalizations.of(context)!.cancel),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(newValue),
        child: Text(AppLocalizations.of(context)!.save),
      ),
    ],
  );
}
