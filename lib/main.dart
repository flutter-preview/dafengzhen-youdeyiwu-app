import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/app/app.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/common/app_theme_data.dart';
import 'package:youdeyiwu_app/constants/app_constant.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/content/bloc/content_bloc.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_bloc.dart';
import 'package:youdeyiwu_app/contentid/content_id.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/login/bloc/login_bloc.dart';
import 'package:youdeyiwu_app/login/login.dart';
import 'package:youdeyiwu_app/message/bloc/message_bloc.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_bloc.dart';
import 'package:youdeyiwu_app/postid/post_id.dart';
import 'package:youdeyiwu_app/privacy/privacy.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';
import 'package:youdeyiwu_app/register/register.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/global_service.dart';
import 'package:youdeyiwu_app/terms/terms.dart';
import 'package:youdeyiwu_app/user/bloc/user_bloc.dart';
import 'package:youdeyiwu_app/userid/bloc/user_id_bloc.dart';
import 'package:youdeyiwu_app/userid/user_id.dart';

/// main
void main() async {
  await GlobalService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _buildBlocProviders(),
      child: _buildApp(),
    );
  }

  List<BlocProvider> _buildBlocProviders() {
    return [
      BlocProvider<GlobalBloc>(create: (_) => GlobalBloc()),
      BlocProvider<AppBloc>(create: (_) => AppBloc()),
      BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
      BlocProvider<ContentBloc>(create: (_) => ContentBloc()),
      BlocProvider<MessageBloc>(create: (_) => MessageBloc()),
      BlocProvider<UserBloc>(create: (_) => UserBloc()),
      BlocProvider<ContentIdBloc>(create: (_) => ContentIdBloc()),
      BlocProvider<PostIdBloc>(create: (_) => PostIdBloc()),
      BlocProvider<UserIdBloc>(create: (_) => UserIdBloc()),
      BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
      BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
    ];
  }

  Widget _buildApp() {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => _buildMaterialApp(context),
    );
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp(
      locale: const Locale("zh"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'youdeyiwu',
      onGenerateTitle: (context) => dotenv.get(AppConstant.appNameAbbr),
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: (RouteSettings settings) =>
          _generateRoute(context, settings),
    );
  }

  Route<dynamic> _generateRoute(BuildContext context, RouteSettings settings) {
    print("name => ${settings.name}");

    final routeBuilder = AppConfig.getRoutes(
        context: context, settings: settings)[settings.name];
    return MaterialPageRoute(
      builder: routeBuilder ?? (_) => const App(),
      settings: settings,
    );
  }
}

class AppConfig {
  static Map<String, WidgetBuilder> getRoutes({
    required BuildContext context,
    required RouteSettings settings,
  }) {
    final routes = <String, WidgetBuilder>{
      AppRoutes.login: (_) => const Login(),
      AppRoutes.register: (_) => const Register(),
      AppRoutes.terms: (_) => const Terms(),
      AppRoutes.privacy: (_) => const Privacy(),
      AppRoutes.root: (_) => const App(),
    };

    if (settings.name!.startsWith(AppRoutes.contentId)) {
      final id =
          RegExp(r'^/sections/(\d+)$').firstMatch(settings.name!)?.group(1);
      if (id != null) {
        routes[settings.name!] = (_) => const ContentId();
      }
    } else if (settings.name!.startsWith(AppRoutes.postId)) {
      final id = RegExp(r'^/posts/(\d+)$').firstMatch(settings.name!)?.group(1);
      if (id != null) {
        routes[settings.name!] = (_) => const PostId();
      }
    } else if (settings.name!.startsWith(AppRoutes.userId)) {
      final id = RegExp(r'^/users/(\d+)$').firstMatch(settings.name!)?.group(1);
      if (id != null) {
        routes[settings.name!] = (_) => const UserId();
      }
    }

    return routes;
  }
}
