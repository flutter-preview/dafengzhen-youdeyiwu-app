import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_state.dart';
import 'package:youdeyiwu_app/content/content.dart';
import 'package:youdeyiwu_app/home/home.dart';
import 'package:youdeyiwu_app/message/message.dart';
import 'package:youdeyiwu_app/tool/tool.dart';
import 'package:youdeyiwu_app/user/user.dart';

/// App
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

/// _AppState
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      Widget? body = [
        const Home(),
        const Content(),
        const Message(),
        const User(),
      ][state.currentIndex];

      return SafeArea(
          child: Scaffold(
        body: body,
        bottomNavigationBar: buildBottomNavigationBar(
          context: context,
        ),
      ));
    });
  }
}
