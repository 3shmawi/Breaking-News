import 'package:c3/ahmed_alaa/ctrl/theme.dart';
import 'package:c3/ahmed_alaa/ctrl/user.dart';
import 'package:c3/ahmed_alaa/screens/l3/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlaaApp extends StatelessWidget {
  const AlaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCtrl(),
        ),
        BlocProvider(
          create: (context) => UserCtrl()..getData(),
        ),
      ],
      child: BlocBuilder<ThemeCtrl, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(colorScheme: ColorScheme.light()),
            darkTheme: ThemeData(colorScheme: ColorScheme.dark()),
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}
//{
// "name" :"Alaa"
// }
//map json
