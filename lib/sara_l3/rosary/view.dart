import 'package:c3/sara_l3/get_data_cubit/get_data_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RosaryView extends StatefulWidget {
  const RosaryView({super.key});

  @override
  State<RosaryView> createState() => _RosaryViewState();
}

class _RosaryViewState extends State<RosaryView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GetDataCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.more_vert),
        title: const Text('مسبحة الكترونية'),
        actions: [
          BlocBuilder<GetDataCubit, GetDataState>(
            builder: (context, state) {
              return state is GetDataFromApiLoadingState
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : IconButton(
                      onPressed: () {
                        cubit.getData();
                      },
                      icon: const Icon(CupertinoIcons.news),
                    );
            },
          ),
        ],
      ),
      body: Center(
        child: cubit.azkar == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: cubit.counter / cubit.total,
                        strokeAlign: 22,
                        strokeWidth: 8,
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Card(
                          shape: const CircleBorder(),
                          child: Image.network(
                              "https://cdn4.iconfinder.com/data/icons/muslim-and-mosque/512/Muslim_Mosque-01-128.png"),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    margin: const EdgeInsets.all(40),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: Colors.cyan,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(cubit.counter.toString()),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Text(
                              cubit.azkar!.content,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 20,
                              backgroundColor: Colors.cyan,
                              minimumSize: const Size(10, 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              cubit.rest();
                            },
                            child: const Text('إعادة'),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 20,
                              backgroundColor: Colors.green,
                              minimumSize: const Size(10, 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: () {
                              cubit.decrement();
                            },
                            child:
                                Text(cubit.counter == 0 ? "ذكر جديد" : 'تسبيح'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
