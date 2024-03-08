import 'package:c3/eyad/view/chats/view.dart';
import 'package:c3/eyad/view/home/view.dart';
import 'package:c3/eyad/view/profile/view.dart';
import 'package:flutter/material.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int index = 0;

  List<Widget> views = [
    const HomeView(), // 0
    const ChatView(), // 1
    const SettingView(), // 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Facebook"),
      ),
      body: views[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (pageNumber) {
          index = pageNumber;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mark_unread_chat_alt_sharp), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
