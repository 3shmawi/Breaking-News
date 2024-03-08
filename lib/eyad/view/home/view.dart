import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Item();
      },
      itemCount: 10,
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 35,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eyad",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "now",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _popup(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20,
              ),
              child: Text(
                "Hello  every one this is my first post ",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _popup() {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert,
      ),
      onSelected: (value) {
        switch (value) {
          case "Delete":
            print("Delete");
          case "Edit":
            print("Edit");
          case "Share":
            print("Share");
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: "Delete",
            child: Text("Delete"),
          ),
          const PopupMenuItem(
            value: "Edit",
            child: Text("Edit"),
          ),
          const PopupMenuItem(
            value: "Share",
            child: Text("Share"),
          ),
        ];
      },
    );
  }
}
