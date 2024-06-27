import 'package:flutter/material.dart';

class HomeNourScreen extends StatefulWidget {
  const HomeNourScreen({super.key});

  @override
  State<HomeNourScreen> createState() => _HomeNourScreenState();
}

class _HomeNourScreenState extends State<HomeNourScreen> {
  List<String> titles = [
    "Food",
    "Sports",
    "Fashion",
    "Gaming",
    "Food",
    "Sports",
    "Fashion",
    "Gaming",
    "Food",
    "Sports",
    "Fashion",
    "Gaming",
    "Food",
    "Sports",
    "Fashion",
    "Gaming",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              titles[index],
                              style: TextStyle(
                                  color: index == currentIndex
                                      ? Colors.white
                                      : Colors.white24),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            if (index == currentIndex)
                              Container(
                                width: 20,
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: titles.length,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue[900],
        unselectedItemColor: Colors.white10,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.baby_changing_station),
            label: 'Status',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
