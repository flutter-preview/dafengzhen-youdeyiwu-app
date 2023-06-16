import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/login/bloc/login_bloc.dart';
import 'package:youdeyiwu_app/login/bloc/login_controller.dart';
import 'package:youdeyiwu_app/login/bloc/login_state.dart';
import 'package:youdeyiwu_app/login/widget/logo.dart';
import 'package:youdeyiwu_app/login/widget/placeholder.dart';
import 'package:youdeyiwu_app/login/widget/switch_register.dart';
import 'package:youdeyiwu_app/login/widget/username.dart';
import 'package:youdeyiwu_app/login/widget/welcome_message.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// Login
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

/// _LoginState
class _LoginState extends State<Login> {
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

    var apiClient = ApiClient();
    try {
      await LoginController(context: context)
          .refreshCaptchaImage(apiClient: apiClient);
      _lastRefreshTime = DateTime.now();
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  @override
  void initState() {
    super.initState();
    LoginController(context: context).init();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _codeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
                    registerMessage(context: context),
                    welcomeMessage(context: context),
                    Usernmae(
                      context: context,
                      state: state,
                      formKey: _formKey,
                      usernameTextController: _usernameTextController,
                      passwordTextController: _passwordTextController,
                      codeTextController: _codeTextController,
                    ),
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
