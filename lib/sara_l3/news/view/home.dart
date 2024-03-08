import 'package:c3/sara_l3/news/config/configs.dart';
import 'package:c3/sara_l3/news/controller/cubit.dart';
import 'package:c3/sara_l3/news/model/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //750
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.width);
    final data = context.watch<AppController>().newsModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Newsfire"),
        actions: [
          IconButton(
            onPressed: () {
              // context.read<AppController>().toggleTheme();
            },
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Row(
        children: [
          if (width >= 750)
            Container(
              color: Theme.of(context).canvasColor,
              width: width / 3,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text("Home"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.science_outlined),
                    title: const Text("Science"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.sports),
                    title: const Text("Sports"),
                    onTap: () {
                      context.read<AppController>().getNewsData("sports");
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.business),
                    title: const Text("Business"),
                    onTap: () {},
                  )
                ],
              ),
            ),
          Expanded(
            child: data == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => Item(data.articles[index]),
                    itemCount: data.articles.length,
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: (n) {
          // context.read<AppController>().getNewsData("sports");
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Science',
            icon: Icon(
              Icons.science_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Sports',
            icon: Icon(
              Icons.sports,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Business',
            icon: Icon(
              Icons.business,
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item(this.article, {super.key});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black,
              ),
              height: 150,
              width: 200,
              child: Image.network(
                article.urlToImage == null
                    ? AppConfigs.defaultImg
                    : _getImg(article.urlToImage!),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (article.author != null)
                      Text(
                        article.author ?? "",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    Expanded(
                      child: Text(
                        article.title,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getImg(String url) {
    return "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2023/11/0/0/Job-fair-sign.jpg?ve=1&tl=1";
  }
}
