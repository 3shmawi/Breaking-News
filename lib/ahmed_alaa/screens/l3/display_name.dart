import 'package:c3/ahmed_alaa/ctrl/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          context.read<UserCtrl>().user!.results!.first.gender.toString(),
          style: TextStyle(
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
