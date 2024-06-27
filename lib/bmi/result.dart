import 'package:c3/bmi/constants.dart';
import 'package:flutter/material.dart';

class BmiResultView extends StatelessWidget {
  const BmiResultView({
    required this.index,
    required this.isMale,
    super.key,
  });

  final bool isMale;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text(
          "Bmi Results",
        ),
      ),
      body: Center(
        child: Image.asset(
          isMale ? AppConsts.man[index] : AppConsts.woman[index],
          color: AppConsts.colors[index],
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
