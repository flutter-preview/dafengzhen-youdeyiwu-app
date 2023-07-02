import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/model/vo/user/contact_vo.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// Contact
class Contact extends StatefulWidget {
  final List<ContactVo> contacts;

  const Contact({super.key, required this.contacts});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    var contacts = widget.contacts;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: (contacts.isEmpty)
            ? buildNoMoreDataWidget(context: context)
            : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  var contact = contacts[index];

                  return Column(
                    children: [
                      ListTile(
                        leading: Text(contact.key),
                        title: Text(contact.val),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: contact.val));
                          showSnackBar(
                            context: context,
                            e: AppLocalizations.of(context)!.clipboardText,
                            type: SnackBarTypeEnum.primary,
                          );
                        },
                      ),
                      const Divider(
                        color: AppColorsLight.borderColor,
                      ),
                    ],
                  );
                },
              ),
      ),
    ));
  }
}
