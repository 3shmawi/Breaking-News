import 'package:c3/salma_l3/projects/get_user/model/user_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SalmaUserProfilePageView extends StatefulWidget {
  const SalmaUserProfilePageView({super.key});

  @override
  State<SalmaUserProfilePageView> createState() =>
      _SalmaUserProfilePageViewState();
}

class _SalmaUserProfilePageViewState extends State<SalmaUserProfilePageView> {
  final _dio = Dio();

  UserData? userData;

  _getUsrData() {
    _dio.get("https://randomuser.me/api/").then((response) {
      setState(() {
        userData = UserData.fromJson(response.data);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsrData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: Center(
        child: userData == null
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //image will be here
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.deepOrange,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        userData!.results!.first.picture!.large!,
                      ),
                    ),
                  ),

                  Text(
                    "${userData!.results!.first.name!.title!}: ${userData!.results!.first.name!.first!} ${userData!.results!.first.name!.last!}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "EMAIL: ${userData!.results!.first.email!}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "PHONE: ${userData!.results!.first.phone!}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${userData!.results!.first.location!.country!}, ${userData!.results!.first.location!.city!}, ${userData!.results!.first.location!.state!}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
