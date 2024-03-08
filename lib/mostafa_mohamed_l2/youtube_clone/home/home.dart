import 'package:c3/mostafa_mohamed_l2/youtube_clone/home/web/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mobile/components.dart';
import 'mobile/view.dart';

class YouTubeClone extends StatefulWidget {
  const YouTubeClone({super.key});

  @override
  State<YouTubeClone> createState() => _YouTubeCloneState();
}

class _YouTubeCloneState extends State<YouTubeClone> {
  List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.play_rectangle_fill,
    CupertinoIcons.plus_circle,
    CupertinoIcons.play_rectangle,
    CupertinoIcons.person
  ];
  List<String> labels = [
    "Home",
    "Shorts",
    "MakeVideos",
    "Subscriptions",
    "You",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leadingWidth: 25,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        title: width > 580
            ? const AppBarTitle()
            : Image.asset(
                'assets/youtube_logo.png',
                height: 60,
                width: 100,
              ),
        actions: [
          if (width <= 580)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          if (width <= 580)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
              ),
            ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_outlined,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 15, left: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "9+",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 20,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          if (width > 580)
            Column(
              children: List.generate(
                icons.length,
                (index) => Item(
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                  },
                  isSelected: currentIndex == index,
                  label: labels[index],
                  icon: icons[index],
                ),
              ),
            ),
          Expanded(
            child: Column(
              children: [
                const Categories(),
                if (width <= 580) const MobileView(),
                if (width > 580) const WebView(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: width <= 580
          ? BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: List.generate(
                icons.length,
                (index) => BottomNavigationBarItem(
                  label: labels[index],
                  icon: Icon(
                    icons[index],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

//640
//790
class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    return Row(
      children: [
        Image.asset(
          'assets/youtube_logo.png',
          height: 60,
          width: 100,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 20, left: width / 14),
            padding: const EdgeInsets.only(left: 20),
            height: 40,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Search',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.black,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(40),
                  ),
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(40),
                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: .1,
                      ),
                    ),
                    child: const Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.black12,
          splashColor: Colors.white,
          hoverColor: Colors.grey,
          focusColor: Colors.grey,
          foregroundColor: Colors.black,
          elevation: 0,
          onPressed: () {},
          mini: true,
          child: const Icon(Icons.mic),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    required this.label,
    required this.icon,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final bool isSelected;
  final String label;
  final IconData icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
