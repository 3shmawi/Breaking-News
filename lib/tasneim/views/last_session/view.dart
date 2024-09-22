import 'package:flutter/material.dart';

//MaterialApp
//Placeholder
//Scaffold
//AppBar
//Text
//Icon
//IconButton
//TextButton

//Row  Column  Stack  ListView  Wrap
//Container
//Card
//Padding
//Center
//SizedBox
// SingleChildScrollView
// ClipRRect
// Offset
// CircularProgressIndicator
// LinearProgressIndicator
// ListWheelScrollView
// Transform
// Expanded
class LastSession extends StatelessWidget {
  const LastSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(
          "Hello Tasniem",
        ),
        leading: Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "data",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            blurRadius: 10,
                            offset: Offset(10, 100),
                          ),
                        ]),
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
                    width: 80,
                    color: Colors.deepOrange,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    color: Colors.cyan,
                  ),
                  SizedBox(
                    height: 200,
                    width: 100,
                    child: Card(
                      elevation: 30,
                      color: Colors.cyan,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "data",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://plus.unsplash.com/premium_photo-1677560517139-1836389bf843?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircularProgressIndicator(),
                  SizedBox(width: 100, child: LinearProgressIndicator()),
                ],
              ),
            ),
          ),
          Expanded(
            child: Transform.rotate(
              angle: -1.6,
              child: ListWheelScrollView(
                useMagnifier: false,
                itemExtent: 250,
                children: List.generate(
                  100,
                  (index) => Stack(
                    children: [
                      Card(
                        elevation: 10,
                        color: Colors.deepPurple,
                        child: Image.network(
                            "https://plus.unsplash.com/premium_photo-1677560517139-1836389bf843?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8"),
                      ),
                      CircleAvatar(
                        child: Text(index.toString()),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 100,
              ),
              itemBuilder: (context, index) => Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("data"),
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
