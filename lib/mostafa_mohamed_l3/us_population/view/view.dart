import 'package:c3/mostafa_mohamed_l3/us_population/model/us.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsPopulationView extends StatefulWidget {
  const UsPopulationView({super.key});

  @override
  State<UsPopulationView> createState() => _UsPopulationViewState();
}

class _UsPopulationViewState extends State<UsPopulationView> {
  @override
  void initState() {
    _fetch();
    super.initState();
  }

  PopulationModel? model;
  final dio = Dio();

  void _fetch() {
    model = null;
    dio
        .get(
            "https://datausa.io/api/data?drilldowns=Nation&measures=Population")
        .then((value) {
      model = PopulationModel.fromJson(value.data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: model == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: Text(model!.data[index].year),
                title: Text(model!.data[index].population.toString()),
                trailing: const Icon(CupertinoIcons.globe),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: model!.data.length,
            ),
    );
  }
}
