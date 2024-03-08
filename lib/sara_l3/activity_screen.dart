import 'package:c3/sara_l3/get_data_cubit/get_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<GetDataCubit>().data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Activity Screen"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetDataCubit>().getData();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 100),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: data['activity'] == null || data['type'] == null
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '${data['activity']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '${data['type']}',
                            style: const TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
