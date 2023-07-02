import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/service/security_service.dart';
import 'package:youdeyiwu_app/user/bloc/user_bloc.dart';
import 'package:youdeyiwu_app/user/bloc/user_controller.dart';
import 'package:youdeyiwu_app/user/bloc/user_state.dart';
import 'package:youdeyiwu_app/user/widget/menugroup1.dart';
import 'package:youdeyiwu_app/user/widget/menugroup2.dart';
import 'package:youdeyiwu_app/user/widget/menugroup3.dart';
import 'package:youdeyiwu_app/user/widget/menugroup4.dart';
import 'package:youdeyiwu_app/user/widget/menugroup5.dart';
import 'package:youdeyiwu_app/user/widget/username.dart';

/// User
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

/// _UserIdState
class _UserState extends State<User> {
  late UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = UserController(context: context)..init();
  }

  /// _refresh
  Future<void> _refresh() async {
    await _userController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      var loggedIn = SecurityService.isUserLoggedIn(context: context);

      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                buildUsername(
                  context: context,
                  user: state.details?.user,
                ),
                SizedBox(
                  height: 16.h,
                ),
                buildMenuGroup1(context: context),
                SizedBox(
                  height: 16.h,
                ),
                if (loggedIn == true) buildMenuGroup4(context: context),
                if (loggedIn == true)
                  SizedBox(
                    height: 16.h,
                  ),
                buildMenuGroup2(
                  context: context,
                  statistics: state.details?.user.statistic,
                ),
                SizedBox(
                  height: 16.h,
                ),
                buildMenuGroup3(
                  context: context,
                  about: state.details?.user.details.about,
                  contacts: state.details?.user.details.contacts ?? [],
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (loggedIn == true) buildMenuGroup5(context: context),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
