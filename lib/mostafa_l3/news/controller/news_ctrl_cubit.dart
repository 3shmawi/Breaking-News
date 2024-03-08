import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/news.dart';
import '../model/news2.dart';

part 'news_ctrl_state.dart';

class NewsCtrlCubit extends Cubit<NewsCtrlState> {
  NewsCtrlCubit() : super(NewsCtrlInitial());

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }

  List<String> labels = [
    "Home",
    "Business",
    "Sports",
    "Science",
    "Health",
  ];
  List<IconData> icons = [
    CupertinoIcons.home,
    Icons.business_center_outlined,
    CupertinoIcons.sportscourt,
    Icons.science_outlined,
    Icons.health_and_safety_outlined,
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    getNewsData(labels[index]);
    emit(ChangeIndexState());
  }

  List<Articles> sources = [];
  List<Articles2> sources2 = [];

  final _dio = Dio();

  void getNewsData([String category = 'Home', String lang = 'en']) {
    if (category == "Home") {
      sources.clear();
    } else {
      sources2.clear();
    }
    emit(NewsCtrlLoading());
    if (category == 'Home') {
      _dio
          .get(
              'https://newsapi.org/v2/everything?q=keyword&apiKey=2fbf9799a7fb47c88f266c543fb36a78')
          .then(
        (value) {
          sources = List.from(value.data['articles'])
              .map((e) => Articles.fromJson(e))
              .toList();
          print(sources.first);
          emit(NewsCtrlSuccess());
        },
      ).catchError(
        (error) {
          emit(NewsCtrlError(error.toString()));
        },
      );
    } else {
      _dio
          .get(
              'https://newsapi.org/v2/top-headlines?category=${category.toLowerCase()}&country=eg&apiKey=2fbf9799a7fb47c88f266c543fb36a78')
          .then(
        (value) {
          sources2 = List.from(value.data['articles'])
              .map((e) => Articles2.fromJson(e))
              .toList();
          print(sources.first);
          emit(NewsCtrlSuccess());
        },
      ).catchError(
        (error) {
          emit(NewsCtrlError(error.toString()));
        },
      );
    }
  }
}
