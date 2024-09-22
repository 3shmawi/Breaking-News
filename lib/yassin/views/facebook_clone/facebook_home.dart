import 'package:flutter/material.dart';

class FacebookHome extends StatelessWidget {
  const FacebookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "facebook",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_circle,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.group,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.shop_2_outlined,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.screen_lock_portrait_sharp,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.notifications,
                  size: 35,
                ),
              ),
              Tab(
                icon: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("assets/facebook.jpeg"),
                      ),
                    ),
                    CircleAvatar(
                      radius: 8,
                      child: Icon(
                        Icons.menu,
                        color: Colors.blue,
                        size: 14,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/facebook.jpeg"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Text(
                        "What are you thing",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 200,
                      width: 100,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Card(
                            color: Colors.cyan,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image(
                              image: AssetImage("assets/facebook.jpeg"),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blue,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundImage:
                                    AssetImage("assets/facebook.jpeg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Yassin",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                  itemCount: 10,
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Image.asset("assets/facebook.jpeg");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
