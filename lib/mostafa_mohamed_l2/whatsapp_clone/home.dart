import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/components/items.dart';
import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/pages/chats.dart';
import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/pages/groups.dart';
import 'package:flutter/material.dart';

class HomeWhatsappPage extends StatelessWidget {
  const HomeWhatsappPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("WhatsApp"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.black,
            dividerColor: Colors.black,
            isScrollable: true,
            indicatorPadding: EdgeInsets.only(top: 5),
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Chats",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Groups",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Updates",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Calls",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatsTab(),
            GroupTab(),
            GroupTab(),
            GroupTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}
