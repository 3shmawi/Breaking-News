//Stateless Stateful
// counter
//stless  stful
import 'package:flutter/material.dart';

class LevelTwoReview extends StatefulWidget {
  const LevelTwoReview({super.key});

  @override
  State<LevelTwoReview> createState() => _LevelTwoReviewState();
}

class _LevelTwoReviewState extends State<LevelTwoReview> {
  int currentIndex = 2;

  List<String> titles = [
    "Level Two",
    "Hello",
    "Hi",
    "Welcome",
    "Mohamed",
    "Ibrahim",
    "Level Two",
    "Hello",
    "Hi",
    "Welcome",
    "Mohamed",
    "Ibrahim",
    "Level Two",
    "Hello",
    "Hi",
    "Welcome",
    "Mohamed",
    "Ibrahim",
  ];

  List<int> selectedIndex = [];

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Level Two",
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isShow = !isShow;
              });
            },
            icon: Icon(
              Icons.visibility,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedCrossFade(
            firstChild: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (selectedIndex.contains(index)) {
                      selectedIndex.remove(index);
                    } else {
                      selectedIndex.add(index);
                    }
                    setState(() {});
                  },
                  child: AnimatedOpacity(
                    opacity: selectedIndex.contains(index) ? 1 : 0.4,
                    duration: Duration(seconds: 3),
                    child: Card(
                      color: selectedIndex.contains(index)
                          ? Colors.blue[900]
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          titles[index],
                          style: TextStyle(
                            color: selectedIndex.contains(index)
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: titles.length,
              ),
            ),
            secondChild: SizedBox(),
            crossFadeState:
                isShow ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(
              milliseconds: 500,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  color:
                      selectedIndex.contains(index) ? Colors.blue[900] : null,
                  child: ListTile(
                    selected: selectedIndex == index,
                    selectedColor: Colors.blue,
                    onTap: () {
                      if (selectedIndex.contains(index)) {
                        selectedIndex.remove(index);
                      } else {
                        selectedIndex.add(index);
                      }
                      setState(() {});
                    },
                    title: Text(titles[index],
                        style: TextStyle(
                          color: selectedIndex.contains(index)
                              ? Colors.white
                              : null,
                        )),
                  ),
                ),
              ),
              itemCount: titles.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade300,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.child_friendly), label: "skdfj"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedIndex.clear();
          });
        },
        child: Icon(Icons.clear),
      ),
    );
  }
}

//void main
//runApp()
//Material app
//Scaffold
