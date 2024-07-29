import 'package:c3/tasneim/views/youtube_clone/layout/details.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeLayoutView extends StatefulWidget {
  const YoutubeLayoutView({super.key});

  @override
  State<YoutubeLayoutView> createState() => _YoutubeLayoutViewState();
}

class _YoutubeLayoutViewState extends State<YoutubeLayoutView> {
  List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "Romance",
    "Sci-Fi",
    "Thriller",
    "War",
    "Western"
  ];

  List<int> selectedIndex = [];
  int currentSelectedIndex = 0;

  //logic
  List<Map<String, dynamic>> data = [
    {
      'videoId': videoId("https://www.youtube.com/watch?v=1bkakLwbPJ0"),
      'title': 'Feedback',
      'channelTitle': 'Flutter',
      'thumbnailUrl': 'https://i.ytimg.com/vi/iLnmTe5Q2Qw/hqdefault.jpg',
      'duration': "1:57:40",
      'views': "251,234,982",
      'time': "Mon 29 Jul 2024"
    },
    {
      'videoId': videoId("https://www.youtube.com/watch?v=yjsN2Goe_po"),
      'title': 'The Shawshank Redemption',
      'channelTitle': 'Francis Ford Coppola',
      'thumbnailUrl': 'https://i.ytimg.com/vi/iLnmTe5Q2Qw/hqdefault.jpg',
      'duration': "1:57:40",
      'views': "251,234,982",
      'time': "Mon 29 Jul 2024"
    },
    {
      'videoId': videoId("https://www.youtube.com/watch?v=fatb7Clc0MM"),
      'title': 'The Shawshank Redemption',
      'channelTitle': 'Francis Ford Coppola',
      'thumbnailUrl': 'https://i.ytimg.com/vi/iLnmTe5Q2Qw/hqdefault.jpg',
      'duration': "1:57:40",
      'views': "251,234,982",
      'time': "Mon 29 Jul 2024"
    },
    {
      'videoId': videoId("https://www.youtube.com/watch?v=B-OmJzOsCcY"),
      'title': 'The Shawshank Redemption',
      'channelTitle': 'Francis Ford Coppola',
      'thumbnailUrl': 'https://i.ytimg.com/vi/iLnmTe5Q2Qw/hqdefault.jpg',
      'duration': "1:57:40",
      'views': "251,234,982",
      'time': "Mon 29 Jul 2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Youtube clone"),
        actions: [
          IconButton(
            icon: Icon(Icons.tv),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, right: 3),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    " 3 ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        bottom: AppBar(
          title: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentSelectedIndex = index;
                    // if (selectedIndex.contains(index)) {
                    //   selectedIndex.remove(index);
                    // } else {
                    //   selectedIndex.add(index);
                    // }
                  });
                },
                child: _categoryItem(
                    categories[index], currentSelectedIndex == index),
              ),
              itemCount: categories.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.video_collection_outlined,
                    color: Colors.redAccent,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Shorts",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => _shortsItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemCount: 4,
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.shop_2_outlined,
                    color: Colors.redAccent,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    categories[currentSelectedIndex],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    _bodyItem(data[index], index == 0),
                separatorBuilder: (context, index) => Divider(),
                itemCount: data.length,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'You',
          ),
        ],
        currentIndex: 0,
      ),
    );
  }

  _categoryItem(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  _shortsItem() {
    return SizedBox(
      height: 300,
      width: 180,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          "https://images.unsplash.com/photo-1591271300850-22d6784e0a7f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D",
          fit: BoxFit.cover,
        ),
        elevation: 5,
      ),
    );
  }

  _bodyItem(Map<String, dynamic> item, bool isStartVideo) {
    return GestureDetector(
      onTap: () {
        // Navigate to video player page with videoId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailsView(item),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                "https://i.ytimg.com/vi/${item["videoId"]}/hqdefault.jpg",
                fit: BoxFit.cover,
              ),
              elevation: 0,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  item["thumbnailUrl"],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "${item["channelTitle"]} . ",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "${item["views"]} views . ",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          item["time"],
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//Stack>> CircleAvatar>> Alignment >> Card

class VideoItem extends StatefulWidget {
  const VideoItem(this.videoId, {super.key});

  final String videoId;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late final YoutubePlayerController _controller;

  _initializeVideo() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        thumbnail: Image.network(
          "https://i.ytimg.com/vi/${widget.videoId}/hqdefault.jpg",
          fit: BoxFit.cover,
        ),
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          // _controller.addListener(listener);
        },
      ),
    );
  }
}

String videoId(String url) {
  String videoId = url.substring(url.lastIndexOf('=') + 1);
  return videoId;
}
