import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/tool/tool.dart';
import 'package:youdeyiwu_app/user/widget/menugroup1.dart';
import 'package:youdeyiwu_app/user/widget/menugroup2.dart';
import 'package:youdeyiwu_app/user/widget/menugroup3.dart';
import 'package:youdeyiwu_app/user/widget/username.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_bloc.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_controller.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_state.dart';

/// UserId
class UserId extends StatefulWidget {
  const UserId({Key? key}) : super(key: key);

  @override
  State<UserId> createState() => _UserIdState();
}

/// _UserIdState
class _UserIdState extends State<UserId> {
  late String id;
  late UserIdController _userIdController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map<String, dynamic> && arguments['id'] != null) {
      id = arguments['id'].toString();
      _userIdController = UserIdController(context: context)..init(id: id);
    }
  }

  /// _refresh
  Future<void> _refresh() async {
    await _userIdController.init(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserIdBloc, UserIdState>(builder: (context, state) {
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
                  isUserId: true,
                ),
                SizedBox(
                  height: 16.h,
                ),
                buildMenuGroup1(context: context, isUserId: true),
                SizedBox(
                  height: 16.h,
                ),
                buildMenuGroup2(
                  context: context,
                  statistics: state.details?.user.statistic,
                  isUserId: true,
                  id: id,
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
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            buildBottomNavigationBar(context: context, isOnTap: true),
      ));
    });
  }
}
