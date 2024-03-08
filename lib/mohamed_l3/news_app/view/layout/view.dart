import 'package:c3/mohamed_l3/news_app/app/consts.dart';
import 'package:c3/mohamed_l3/news_app/controller/app_ctrl.dart';
import 'package:c3/mohamed_l3/news_app/model/news.dart';
import 'package:c3/mohamed_l3/news_app/view/_resources/assets_manager.dart';
import 'package:c3/mohamed_l3/news_app/view/_resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../search/view.dart';

part 'app_bar.dart';
part 'bottom_nav_bar.dart';
part 'drawer.dart';
part 'item.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeAppBar(),
      drawer: const DeDrawer(),
      body: BlocBuilder<AppController, AppStates>(
        builder: (context, state) {
          final cubit = context.read<AppController>();
          if (cubit.articles.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => LayoutItem(cubit.articles[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: cubit.articles.length,
          );
        },
      ),
      bottomNavigationBar: const DeNavBar(),
    );
  }
}
