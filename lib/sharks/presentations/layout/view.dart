import 'package:c3/sharks/app/icon_broken.dart';
import 'package:c3/sharks/presentations/layout/freelance/view.dart';
import 'package:c3/sharks/presentations/layout/home/view.dart';
import 'package:flutter/material.dart';

import 'chats/view.dart';

class SharksLayout extends StatefulWidget {
  const SharksLayout({super.key});

  @override
  State<SharksLayout> createState() => _SharksLayoutState();
}

class _SharksLayoutState extends State<SharksLayout> {
  int currentIndex = 0;
  final List<Widget> children = [    const HomeView(),

    const FreelanceView(),
    const ChatsPage(),
    const HomeView(),
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconBroken.bag),
            label: "Freelance",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconBroken.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconBroken.bookmark),
            label: "Booked",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconBroken.profile),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
