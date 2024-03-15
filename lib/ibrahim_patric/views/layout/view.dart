import 'package:c3/ibrahim_patric/controller/ib_pa_ctrl_cubit.dart';
import 'package:c3/ibrahim_patric/model/news.dart';
import 'package:c3/ibrahim_patric/views/search/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IPLayout extends StatelessWidget {
  const IPLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        centerTitle: false,
        title: const Text("News App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchNewsViewPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<IbPaCtrlCubit, IbPaCtrlState>(
        builder: (BuildContext context, IbPaCtrlState state) {
          var dataNews = context.read<IbPaCtrlCubit>().dataNews;
          if (state is GetNewLoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is GetNewSuccessState) {
            return dataNews.isEmpty
                ? Center(
                    child: Text(
                      "No Data Found",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) =>
                        CardNewsItem(dataNews[index]),
                    itemCount: dataNews.length,
                  );
          }
          return Center(
            child: Text(
              "error",
              style: TextStyle(color: Colors.red),
            ),
          );
        },
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
                image: DecorationImage(
                  image: NetworkImage(
                    article.urlToImage ??
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
