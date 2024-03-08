import 'package:c3/ibrahim_patric/app/config.dart';
import 'package:c3/ibrahim_patric/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class IPLayout extends StatefulWidget {
  const IPLayout({super.key});

  @override
  State<IPLayout> createState() => _IPLayoutState();
}

class _IPLayoutState extends State<IPLayout> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<Articles> dataNews = [];
  final _dio = Dio();

  void _getData() {
    _dio.get(IPAppConf.apiUrl).then((value) {
      setState(() {
        dataNews = List.from(value.data['articles'])
            .map((e) => Articles.fromJson(e))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        title: const Text("News App"),
      ),
      body: dataNews.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Text(index.toString()),
              itemBuilder: (context, index) => CardNewsItem(dataNews[index]),
              itemCount: dataNews.length,
            ),
    );
  }
}

class CardNewsItem extends StatelessWidget {
  const CardNewsItem(this.article, {super.key});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1709646977581-2947c3b22df0?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        article.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1,
                    ),
                    Text(
                      article.publishedAt,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
