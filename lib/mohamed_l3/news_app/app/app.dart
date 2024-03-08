import 'package:c3/mohamed_l3/news_app/app/themes.dart';
import 'package:c3/mohamed_l3/news_app/view/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/app_ctrl.dart';

class Wa2lApp extends StatelessWidget {
  const Wa2lApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppController()
        ..getNews()
        ..getAppInfo(),
      child: BlocBuilder<AppController, AppStates>(
        buildWhen: (p, c) => c is ChangeDarkModeState,
        builder: (context, state) {
          final isDark = context.read<AppController>().darkMode;
          return MaterialApp(
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
