import 'package:c3/ibrahim_patric/controller/ib_pa_ctrl_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/layout/view.dart';

class IbPaApp extends StatelessWidget {
  const IbPaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return IbPaCtrlCubit()..getData();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IPLayout(),
      ),
    );
  }
}

//controller
//views
//model
//ToDo revision for level 3
//ToDo add categories
//ToDo get apk
//ToDo get web
//ToDo select country
//ToDo clickable
