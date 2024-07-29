import 'package:flutter/material.dart';

class InstagramLayoutScreen extends StatefulWidget {
  const InstagramLayoutScreen({super.key});

  @override
  State<InstagramLayoutScreen> createState() => _InstagramLayoutScreenState();
}

class _InstagramLayoutScreenState extends State<InstagramLayoutScreen> {
  bool isDark = true;

  List<Map<String, String>> dummy = [
    {
      "name": "Mohamed Ashamwi",
      "image":
          "https://images.unsplash.com/photo-1720206811364-684e8f8e803f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8",
    },
    {
      "name": "Tasniem Hany",
      "image":
          "https://images.unsplash.com/photo-1720247521923-f531207d23d8?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3fHx8ZW58MHx8fHx8",
    },
    {
      "name": "Hany Eldawy",
      "image":
          "https://images.unsplash.com/photo-1719221253506-57f70fadfd0d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzOXx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Salah Ashamwi",
      "image":
          "https://images.unsplash.com/photo-1719935190609-c075f3dada9d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "name": "Rehab Hamdy",
      "image":
          "https://images.unsplash.com/photo-1591271300850-22d6784e0a7f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D",
    },
  ];
  List<Map<String, dynamic>> dummyPost = [
    {
      "name": "Mohamed Ashamwi",
      "image":
          "https://images.unsplash.com/photo-1720206811364-684e8f8e803f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8",
      "postImage":
          "https://images.unsplash.com/photo-1591271300850-22d6784e0a7f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D",
      "likes": 1000,
      "comments": 1000,
      "postContent":
          "Hello everyone, this is my favorite fruit.\ni love this very very much",
      "isLiked": false,
      "isSaved": false,
    },
    {
      "name": "Tasniem Hany",
      "image":
          "https://images.unsplash.com/photo-1720247521923-f531207d23d8?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3fHx8ZW58MHx8fHx8",
      "postImage":
          "https://images.unsplash.com/photo-1591271300850-22d6784e0a7f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D",
      "likes": 1000,
      "comments": 1000,
      "postContent": "hey there anyone here!",
      "isLiked": false,
      "isSaved": false,
    },
    {
      "name": "Hany Eldawy",
      "image":
          "https://images.unsplash.com/photo-1719221253506-57f70fadfd0d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzOXx8fGVufDB8fHx8fA%3D%3D",
      "postImage": "",
      "likes": 1000,
      "comments": 1000,
      "postContent": "السلام عليكم ورحمة الله",
      "isLiked": false,
      "isSaved": false,
    },
    {
      "name": "Salah Ashamwi",
      "image":
          "https://images.unsplash.com/photo-1719935190609-c075f3dada9d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D",
      "postImage": "",
      "likes": 1000,
      "comments": 1000,
      "postContent": "wow.com its fantastic app who is the developer ",
      "isLiked": false,
      "isSaved": false,
    },
    {
      "name": "Rehab Hamdy",
      "image":
          "https://images.unsplash.com/photo-1591271300850-22d6784e0a7f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D",
      "postImage":
          "https://images.unsplash.com/photo-1720206811364-684e8f8e803f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8",
      "likes": 1000,
      "comments": 1000,
      "postContent": "i'm here",
      "isLiked": false,
      "isSaved": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              "lib/tasneim/assets/word.png",
              color: isDark ? Colors.white : Colors.black,
              height: 50,
              width: 100,
            ),
            Expanded(
              child: Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white : Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                //empty
              },
              icon: Icon(
                Icons.favorite_border,
                color: Colors.deepOrange,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {});
                isDark = !isDark;
              },
              icon: Icon(
                !isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                color: isDark ? Colors.white : Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: (isDark ? Colors.white : Colors.black).withOpacity(.5),
              height: .4,
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: StoryItem(
                    name: dummy[index]["name"]!,
                    img: dummy[index]["image"]!,
                  ),
                ),
                itemCount: dummy.length,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  PostItem(isDark, dummyPost[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: dummyPost.length,
            ),
          ],
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({
    required this.name,
    required this.img,
    super.key,
  });

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.deepOrange,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(img),
          ),
        ),
        SizedBox(
          width: 85,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class PostItem extends StatefulWidget {
  const PostItem(this.isDark, this.post, {super.key});

  final bool isDark;
  final Map<String, dynamic> post;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.deepOrange,
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: widget.isDark ? Colors.white : Colors.black,
                  backgroundImage: NetworkImage(widget.post['image']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.post['name'],
                  style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                '. 1d',
                style: TextStyle(
                  color: widget.isDark ? Colors.white : Colors.black,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              PopupMenuButton(
                color: widget.isDark ? Colors.white : Colors.black,
                icon: Icon(
                  Icons.more_horiz,
                  color: widget.isDark ? Colors.white : Colors.black,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (widget.post['postImage'] != "")
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.post['postImage'],
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: widget.isDark ? Colors.white : Colors.black,
                  width: .5,
                ),
              ),
            ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.post['isLiked'] = !widget.post['isLiked'];
                  });
                },
                icon: Icon(
                  widget.post['isLiked']
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment,
                  color: widget.isDark ? Colors.white : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: widget.isDark ? Colors.white : Colors.black,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.post['isSaved'] = !widget.post['isSaved'];
                  });
                },
                icon: Icon(
                  widget.post['isSaved']
                      ? Icons.book
                      : Icons.bookmark_add_outlined,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          Divider(),
          Text(
            "${widget.post["isLiked"] ? widget.post["likes"] + 1 : widget.post["likes"]} Likes",
            style: TextStyle(
              color: widget.isDark ? Colors.white : Colors.black,
              fontSize: 13,
            ),
          ),
          Text(
            widget.post["postContent"],
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            "View all ${widget.post["comments"]} comment",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
