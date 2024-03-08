import 'package:c3/sara_l3/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Counter Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${context.watch<CounterCubit>().counter}",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: context.read<CounterCubit>().increment,
                  child: Text('increment'),
                ),
                SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  onPressed: context.read<CounterCubit>().decrement,
                  child: Text('decrement'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Login"),
            OutlinedButton(
              onPressed: context.read<CounterCubit>().clear,
              child: Text('clear'),
            ),
          ],
        ),
      ),
    );
  }
}
