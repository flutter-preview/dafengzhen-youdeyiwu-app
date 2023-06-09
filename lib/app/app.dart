import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_event.dart';
import 'package:youdeyiwu_app/app/bloc/app_state.dart';

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
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          body: [
            Center(
              child: Text("1"),
            ),
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
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
                // color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.1),
                  )
                ]),
            child: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (value) {
                context.read<AppBloc>().add(TriggerAppEvent(value));
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              // selectedItemColor: AppColors.primaryElement,
              // unselectedItemColor: AppColors.primaryFourElementText,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  label: "首页",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.house),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.house_fill),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "内容",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.card_text),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.card_heading),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "消息",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.bell),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.bell_fill),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "用户",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.person),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(BootstrapIcons.person_fill),
                  ),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
