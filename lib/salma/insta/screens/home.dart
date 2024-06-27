import 'package:c3/salma/insta/app/constants.dart';
import 'package:c3/sharks/app/icon_broken.dart';
import 'package:flutter/material.dart';

class InstaHomePage extends StatelessWidget {
  const InstaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/instagram/logo2.png",
          height: 50,
        ),
        actions: [
          IconButton(
            icon: Icon(IconBroken.heart),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(IconBroken.chat),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _MyStoryItem();
                  }
                  return _OtherStoryItem();
                },
                itemCount: 10,
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            //posts
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _PostItem(),
              itemCount: 5,
            )
          ],
        ),
      ),
    );
  }

  _OtherStoryItem() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 72,
          child: Column(
            children: [
              _img(
                img: "lib/salma/assets/sunrise.png",
              ),
              Text(
                "salma123",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );

  _MyStoryItem() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 72,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: AssetImage(
                        "lib/salma/assets/sunset.png",
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ],
              ),
              Text(
                "my story",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );

  _img({
    required String img,
    double size = 70,
  }) =>
      Container(
        padding: EdgeInsets.all(2),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: instagramGradient,
        ),
        child: Image(
          image: AssetImage(
            img,
          ),
        ),
      );

  _PostItem() => Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _img(
                    img: "lib/salma/assets/sunset.png",
                    size: 50,
                  ),
                  const SizedBox(width: 10),
                  Text("username"),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Image.asset("assets/instagram/insta.png"),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(IconBroken.chat),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(IconBroken.send),
                    onPressed: () {},
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(IconBroken.bookmark),
                    onPressed: () {},
                  ),
                ],
              ),
              Text("1234 likes"),
              Divider(),
            ],
          ),
        ),
      );
}
