import 'package:c3/mostafa_l3/random_usr/controller/usr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomUsrProfileView extends StatelessWidget {
  const RandomUsrProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Random User Profile"),
      ),
      body: BlocBuilder<UsrCubit, UsrState>(
        builder: (BuildContext context, UsrState state) {
          if (state is UsrLoadingState || state is UsrErrorState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = context.read<UsrCubit>().model!.results.first;
          return Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(data.picture.medium),
              ),
              Text(
                "${data.name.title}: ${data.name.first} ${data.name.last}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 0,
                ),
              ),
              Text(
                data.email,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Location: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${data.location.country}, ${data.location.city}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Text(data.phone),
              Text(data.gender),
              Text(data.nat),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
