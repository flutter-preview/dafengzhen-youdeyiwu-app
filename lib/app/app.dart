import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_event.dart';
import 'package:youdeyiwu_app/app/bloc/app_state.dart';
import 'package:youdeyiwu_app/home/home.dart';

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
      return SafeArea(
          child: Scaffold(
        body: [
          Home(),
          Center(
            child: Text("2"),
          ),
          Center(
            child: Text("3"),
          ),
          Center(
            child: Text("4"),
          ),
        ][state.index],
        bottomNavigationBar: Container(
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
            currentIndex: state.index,
            onTap: (value) {
              context.read<AppBloc>().add(TriggerAppEvent(value));
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
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
        ),
      ));
    });
  }
}
