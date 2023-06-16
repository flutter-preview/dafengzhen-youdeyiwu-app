import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_constant.dart';
import 'package:youdeyiwu_app/login/bloc/login_bloc.dart';
import 'package:youdeyiwu_app/login/bloc/login_controller.dart';
import 'package:youdeyiwu_app/login/bloc/login_event.dart';
import 'package:youdeyiwu_app/login/bloc/login_state.dart';
import 'package:youdeyiwu_app/login/widget/submit_btn.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// Usernmae
Widget Usernmae({
  required BuildContext context,
  required LoginState state,
  required GlobalKey<FormState> formKey,
  required TextEditingController usernameTextController,
  required TextEditingController passwordTextController,
  required TextEditingController codeTextController,
}) {
  var globalState = context.read<GlobalBloc>().state;
  var enable = globalState.path?.imageConfig?.enable == true;

  return Padding(
    padding: EdgeInsets.all(16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.account,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 6.h,
              ),
              buildTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.accountEmptyError;
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<LoginBloc>().add(UsernameEvent(value));
                },
                controller: usernameTextController,
                prefixIcon: const Icon(Icons.person),
                hintText: AppLocalizations.of(context)!.accountInputPrompt,
                value: state.username,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context)!.password,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 6.h,
              ),
              buildTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.passwordEmptyError;
                  }
                  return null;
                },
                onChanged: (value) {
                  context.read<LoginBloc>().add(PasswordEvent(value));
                },
                controller: passwordTextController,
                prefixIcon: const Icon(Icons.lock),
                hintText: AppLocalizations.of(context)!.passwordInputPrompt,
                value: state.password,
                obscureText: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              if (enable)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.verificationCode,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .verificationCodeEmptyError;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(VerificationCodeEvent(value));
                            },
                            controller: codeTextController,
                            prefixIcon: const Icon(Icons.code),
                            hintText: AppLocalizations.of(context)!
                                .enterVerificationCode,
                            value: state.verificationCode,
                          ),
                        ),
                        if (state.verificationCodeId.isNotEmpty)
                          buildVerificationCodeUrl(
                              context: context, state: state),
                      ],
                    ),
                  ],
                ),
              submitBtn(context: context, formKey: formKey, type: "username")
            ],
          ),
        ),
      ],
    ),
  );
}

/// buildVerificationCodeUrl
Widget buildVerificationCodeUrl(
    {required BuildContext context, required LoginState state}) {
  DateTime lastRefreshTime = DateTime.now();

  Future<void> onRefresh() async {
    if (DateTime.now().difference(lastRefreshTime) < Duration(seconds: 5)) {
      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!
            .operationTooFrequentPleaseTryAgainLater,
      );
      return;
    }

    await LoginController(context: context).refreshCaptchaImage();
    lastRefreshTime = DateTime.now();
  }

  return Padding(
    padding: const EdgeInsets.only(left: 16),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onRefresh,
        child: Image(
          image: NetworkImage(
            "${dotenv.get(AppConstant.appApiServer)}/captcha/image/${state.verificationCodeId}",
          ),
          width: 100,
          height: 56,
        ),
      ),
    ),
  );
}

/// buildTextFormField
Widget buildTextFormField({
  required TextEditingController controller,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  String? hintText,
  String? value,
  Widget? prefixIcon,
  bool obscureText = false,
  bool? isNumeric = false,
}) {
  return TextFormField(
    inputFormatters:
        isNumeric == true ? [FilteringTextInputFormatter.digitsOnly] : null,
    keyboardType: isNumeric == true ? TextInputType.number : null,
    validator: validator,
    onChanged: onChanged,
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColorsLight.borderColor),
      ),
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: (value != null && value.isNotEmpty)
          ? IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: const Icon(Icons.clear),
            )
          : null,
    ),
  );
}
