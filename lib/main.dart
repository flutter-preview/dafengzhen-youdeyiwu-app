import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/app/app.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/common/app_theme_data.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';
import 'package:youdeyiwu_app/service/global_service.dart';

/// main
void main() async {
  await GlobalService.init();
  runApp(MyApp());
}

/// MyApp
class MyApp extends MultiBlocProvider {
  MyApp({super.key})
      : super(
          providers: [
            BlocProvider(
              create: (context) => AppBloc(),
            ),
            BlocProvider(
              create: (context) => RegisterBloc(),
            ),
          ],
          child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
              locale: const Locale("zh"),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              title: 'youdeyiwu',
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appNameAbbr,
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: ThemeMode.light,
              onGenerateRoute: (RouteSettings settings) {
                print("name => ${settings.name}");
                return MaterialPageRoute(
                    builder: (_) => const App(), settings: settings);
              },
            ),
          ),
        );
}
