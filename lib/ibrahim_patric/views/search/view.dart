import 'package:c3/ibrahim_patric/controller/ib_pa_ctrl_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/view.dart';

class SearchNewsViewPage extends StatefulWidget {
  const SearchNewsViewPage({super.key});

  @override
  State<SearchNewsViewPage> createState() => _SearchNewsViewPageState();
}

class _SearchNewsViewPageState extends State<SearchNewsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        title: Text("Search News"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _bottomSheet(context);
            },
          )
        ],
      ),
      body: BlocBuilder<IbPaCtrlCubit, IbPaCtrlState>(
        builder: (context, state) {
          final cubit = context.read<IbPaCtrlCubit>();

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (v) {
                    cubit.search(v);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Search about anything....",
                  ),
                ),
                Expanded(
                  child: cubit.searchResults.isEmpty
                      ? const Center(
                          child: Text(
                            "No results",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) =>
                              CardNewsItem(cubit.searchResults[index]),
                          itemCount: cubit.searchResults.length,
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text("Search"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
