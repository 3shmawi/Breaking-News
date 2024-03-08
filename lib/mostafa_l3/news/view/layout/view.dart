import 'package:c3/mostafa_l3/news/app/consts.dart';
import 'package:c3/mostafa_l3/news/controller/news_ctrl_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/news2.dart';
import '../shared/news_item.dart';

class LayoutNewsPage extends StatelessWidget {
  const LayoutNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text("Home"),
        actions: [
          BlocBuilder<NewsCtrlCubit, NewsCtrlState>(
            buildWhen: (previousState, currentState) =>
                currentState is ChangeThemeState,
            builder: (context, state) {
              final cubit = context.read<NewsCtrlCubit>();

              return IconButton(
                icon: Icon(
                    cubit.isDark ? Icons.dark_mode_outlined : Icons.light_mode),
                onPressed: () {
                  cubit.changeTheme();
                },
              );
            },
          ),
          _moreButton()
        ],
      ),
      body: BlocBuilder<NewsCtrlCubit, NewsCtrlState>(
        buildWhen: (previousState, currentState) =>
            currentState is NewsCtrlSuccess || currentState is NewsCtrlLoading,
        builder: (BuildContext context, NewsCtrlState state) {
          final cubit = context.read<NewsCtrlCubit>();

          return state is! NewsCtrlSuccess
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) => cubit.currentIndex == 0
                      ? NewsItem(cubit.sources[index])
                      : NewsItem2(cubit.sources2[index]),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.deepPurple,
                  ),
                  itemCount: cubit.currentIndex == 0
                      ? cubit.sources.length
                      : cubit.sources2.length,
                );
        },
      ),
      bottomNavigationBar: BlocBuilder<NewsCtrlCubit, NewsCtrlState>(
        buildWhen: (previous, current) => current is ChangeIndexState,
        builder: (BuildContext context, NewsCtrlState state) {
          final cubit = context.read<NewsCtrlCubit>();

          return BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            selectedItemColor: Colors.deepPurple,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            items: List.generate(
              cubit.labels.length,
              (index) => BottomNavigationBarItem(
                icon: Icon(cubit.icons[index]),
                label: cubit.labels[index],
              ),
            ),
          );
        },
      ),
    );
  }

  _moreButton() {
    return PopupMenuButton(
        icon: const Icon(Icons.language),
        onSelected: (value) {
          switch (value) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
            case 4:
              break;
          }
        },
        itemBuilder: (context) {
          return List.generate(
            NewsAppConsts.languages.length,
            (index) => PopupMenuItem(
              value: index,
              child: Row(
                children: [
                  Expanded(child: Text(NewsAppConsts.languages[index])),
                  Text(NewsAppConsts.flags[index]),
                ],
              ),
            ),
          );
        });
  }
}
