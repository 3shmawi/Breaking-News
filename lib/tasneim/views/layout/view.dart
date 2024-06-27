import 'package:flutter/material.dart';

class InstagramLayoutScreen extends StatefulWidget {
  const InstagramLayoutScreen({super.key});

  @override
  State<InstagramLayoutScreen> createState() => _InstagramLayoutScreenState();
}

class _InstagramLayoutScreenState extends State<InstagramLayoutScreen> {
  bool isDark = true;

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
            const Spacer(),
            Container(
              width: 250,
              height: 35,
              padding: EdgeInsets.symmetric(horizontal: 10),
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {});
                isDark = !isDark;
              },
              icon: Icon(
                isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                color: isDark ? Colors.white : Colors.black,
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
              height: 0,
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => StoryItem(isDark),
                itemCount: 10,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => PostItem(isDark),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem(this.isDark, {super.key});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.deepOrange,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: isDark ? Colors.white : Colors.black,
            backgroundImage: AssetImage(
              'lib/tasneim/assets/logo.png',
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            "tasniem",
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

class PostItem extends StatelessWidget {
  const PostItem(this.isDark, {super.key});

  final bool isDark;

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
                  backgroundColor: isDark ? Colors.white : Colors.black,
                  backgroundImage: AssetImage(
                    'lib/tasneim/assets/logo.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Tasniem",
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                '. 1d',
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              PopupMenuButton(
                color: isDark ? Colors.white : Colors.black,
                icon: Icon(
                  Icons.more_horiz,
                  color: isDark ? Colors.white : Colors.black,
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: MediaQuery.of(context).size.height / 1.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1715148470008-329758d3ace7?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fGVufDB8fHx8fA%3D%3D",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isDark ? Colors.white : Colors.black,
                width: .5,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.book,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          Divider(),
          Text(
            "13,432 Likes",
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 13,
            ),
          ),
          Text(
            "azkaar_everyday#أذكار_الصباح_والمساء #اذكار #اسلام #ادعية #دعاء #أدعية #ادعية_يومية #اذكارالمسلم #أذكار_الصباح #اذكار_المساء #الاسلام #قرآن #حديث #احاديث #athkar #azkar #azkar_everyday #islamic #dua #hadiths #islam❤️ #muslim #muslimah #quran #quranquotes #islamicquote",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            "View all 10 comment",
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
