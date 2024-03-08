import 'package:c3/mostafa_l3/news/controller/news_ctrl_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/layout/view.dart';

class MostafaApp extends StatelessWidget {
  const MostafaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return NewsCtrlCubit()..getNewsData();
      },
      child: BlocBuilder<NewsCtrlCubit, NewsCtrlState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: const ColorScheme.light(),
                appBarTheme:
                    const AppBarTheme(backgroundColor: Colors.deepPurple)),
            darkTheme: ThemeData(
                colorScheme: const ColorScheme.dark(),
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Color(0xff121212))),
            themeMode: context.watch<NewsCtrlCubit>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const LayoutNewsPage(),
          );
        },
      ),
    );
  }
}
