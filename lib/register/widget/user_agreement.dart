import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_event.dart';
import 'package:youdeyiwu_app/register/bloc/register_state.dart';

/// userAgreement
Widget userAgreement(
    {required BuildContext context, required RegisterState state}) {
  return Align(
    alignment: Alignment.center,
    child: CheckboxListTile(
      title: InkWell(
        onTap: () {
          context.read<RegisterBloc>().add(UserAgreedEvent(!state.userAgreed));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.agreementText,
                style: const TextStyle(color: AppColorsLight.bodyColor),
              ),
              TextSpan(
                text: AppLocalizations.of(context)!.serviceAgreement,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColorsLight.primaryColor,
                ),
              ),
              TextSpan(
                  text: AppLocalizations.of(context)!.andText,
                  style: const TextStyle(color: AppColorsLight.bodyColor)),
              TextSpan(
                text: AppLocalizations.of(context)!.privacyPolicy,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColorsLight.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: state.userAgreed,
      onChanged: (value) {
        context.read<RegisterBloc>().add(UserAgreedEvent(value ?? false));
      },
    ),
  );
}
