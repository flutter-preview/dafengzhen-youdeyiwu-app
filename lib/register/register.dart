import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_controller.dart';
import 'package:youdeyiwu_app/register/bloc/register_state.dart';
import 'package:youdeyiwu_app/register/widget/logo.dart';
import 'package:youdeyiwu_app/register/widget/placeholder.dart';
import 'package:youdeyiwu_app/register/widget/switch_login.dart';
import 'package:youdeyiwu_app/register/widget/user_agreement.dart';
import 'package:youdeyiwu_app/register/widget/username.dart';
import 'package:youdeyiwu_app/register/widget/welcome_message.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// Register
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

/// _RegisterState
class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _codeTextController = TextEditingController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  DateTime _lastRefreshTime = DateTime.now();

  Future<void> _onRefresh() async {
    if (DateTime.now().difference(_lastRefreshTime) < Duration(seconds: 5)) {
      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!
            .operationTooFrequentPleaseTryAgainLater,
      );
      return;
    }

    await RegisterController(context: context).refreshCaptchaImage();
    _lastRefreshTime = DateTime.now();
  }

  @override
  void initState() {
    super.initState();
    RegisterController(context: context).init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logo(),
                    loginMessage(context: context),
                    welcomeMessage(context: context),
                    Usernmae(
                      context: context,
                      state: state,
                      formKey: _formKey,
                      usernameTextController: _usernameTextController,
                      passwordTextController: _passwordTextController,
                      codeTextController: _codeTextController,
                    ),
                    userAgreement(context: context, state: state),
                    placeholder()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
