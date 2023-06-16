import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_controller.dart';
import 'package:youdeyiwu_app/home/bloc/home_event.dart';

Widget buildSearchBar({
  required BuildContext context,
  required TextEditingController searchController,
}) {
  /// onPressed
  void onPressed(String name) {
    if (name.isNotEmpty) {
      EasyDebounce.debounce('searchPost', const Duration(milliseconds: 1000),
          () {
        HomeController(context: context).searchPostDataByName(name: name);
      });
      context.read<HomeBloc>().add(const UpdateSearchEnabledHomeEvent(true));
    } else {
      EasyDebounce.debounce(
          'searchDefaultPost', const Duration(milliseconds: 1000), () {
        HomeController(context: context).updatePostData();
      });
      context.read<HomeBloc>().add(const UpdateSearchEnabledHomeEvent(false));
    }
  }

  return Form(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: AppColorsLight.borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColorsLight.tertiaryBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(6.w)),
              ),
              child: IconButton(
                icon: const Icon(Icons.search),
                color: AppColorsLight.tertiaryColor,
                onPressed: () {
                  onPressed(searchController.text);
                },
              ),
            ),
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.searchQuery,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.w),
                ),
                onChanged: onPressed,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
