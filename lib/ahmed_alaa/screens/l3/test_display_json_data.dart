import 'package:c3/ahmed_alaa/ctrl/theme.dart';
import 'package:c3/ahmed_alaa/ctrl/user.dart';
import 'package:c3/ahmed_alaa/screens/l3/display_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Map<String, String> data = {"name": "Mohamed", "age": "30", "city": "Paris"};

//dio
class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data'),
        actions: [
          Icon(
            Icons.light_mode_outlined,
            color: Colors.yellow,
          ),
          BlocBuilder<ThemeCtrl, bool>(
            builder: (context, state) {
              final cubit = context.read<ThemeCtrl>();
              return Switch(
                value: cubit.state,
                onChanged: (newValue) {
                  cubit.toggleTheme();
                },
              );
            },
          ),
          Icon(Icons.dark_mode_outlined),
        ],
      ),
      body: BlocBuilder<UserCtrl, UserStates>(
        builder: (context, state) {
          final cubit = context.read<UserCtrl>();
          final user = cubit.user;

          return Center(
            child: state is UserLoadingState
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //     "${comingData["results"][0]["name"]["title"]} ${comingData["results"][0]["name"]["first"]} ${comingData["results"][0]["name"]["last"]}"),

                      Text(
                          "${user!.results!.first.name!.title!}: ${user.results!.first.name!.first!} ${user.results!.first.name!.last!}"),

                      Text(user.results!.first.phone!),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(
                              user.results!.first.picture!.large!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: cubit.getData,
                        child: Text("Get Data"),
                      ),

                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DisplayName(),
                            ),
                          );
                        },
                        child: Text("next page"),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

//state management
//cubit
