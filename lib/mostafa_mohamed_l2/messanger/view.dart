import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/stories.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DefaultAppBar(),
            SearchBar(),
            StoriesBar(),
          ],
        ),
      ),
      bottomNavigationBar: DefaultBottomNavBar(),
    );
  }
}

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white12,
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    radius: 9.5,
                    backgroundColor: Colors.white60,
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '4',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Chats',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: .9,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white12,
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(30)),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
          Text(
            'Search',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              letterSpacing: .9,
            ),
          )
        ],
      ),
    );
  }
}

class StoriesBar extends StatefulWidget {
  const StoriesBar({super.key});

  @override
  State<StoriesBar> createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  final List<Stories> stories = [
    Stories(
      name: 'Mohamed Ashmawi',
      img:
          'https://images.unsplash.com/photo-1700587085844-b96c27958df2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
    ),
    Stories(
      name: 'Mohamed Ashmawi',
      img:
          'https://images.unsplash.com/photo-1700587085844-b96c27958df2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
    ),
    Stories(
      name: 'Mohamed Ashmawi',
      img:
          'https://images.unsplash.com/photo-1700587085844-b96c27958df2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
    ),
    Stories(
      name: 'Mohamed Ashmawi',
      img:
          'https://images.unsplash.com/photo-1700587085844-b96c27958df2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
    ),
    Stories(
      name: 'Mohamed Ashmawi',
      img:
          'https://images.unsplash.com/photo-1700587085844-b96c27958df2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
    ),
    Stories(
      name: 'Mohamed Wa2l',
      img:
          'https://images.unsplash.com/photo-1700653337569-5d7cd0b910aa?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Stories(
      name: 'Mostafa Shady',
      img:
          'https://images.unsplash.com/photo-1700557277193-896271a65773?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => StoriesItem(
          img: stories[index].img,
          name: stories[index].name,
        ),
        itemCount: stories.length,
      ),
    );
  }
}

class StoriesItem extends StatelessWidget {
  const StoriesItem({required this.img, required this.name, super.key});

  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(img),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 75,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 1.2,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DefaultBottomNavBar extends StatefulWidget {
  const DefaultBottomNavBar({super.key});

  @override
  State<DefaultBottomNavBar> createState() => _DefaultBottomNavBarState();
}

class _DefaultBottomNavBarState extends State<DefaultBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        _currentIndex = index;
        setState(() {});
      },
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.chat_bubble_fill,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.video_camera_solid,
          ),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person_2_fill,
          ),
          label: 'People',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.web_stories,
          ),
          label: 'Stories',
        ),
      ],
    );
  }
}
