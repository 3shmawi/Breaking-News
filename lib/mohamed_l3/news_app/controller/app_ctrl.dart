import 'package:c3/mohamed_l3/news_app/app/consts.dart';
import 'package:c3/mohamed_l3/news_app/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends Cubit<AppStates> {
  AppController() : super(AppStateInitial());

  //bottom nav bar
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        getNews(
          category: 'general',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
      case 1:
        getNews(
          category: 'business',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
      case 2:
        getNews(
          category: 'sports',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
      case 3:
        getNews(
          category: 'entertainment',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
      case 4:
        getNews(
          category: 'science',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
      case 5:
        getNews(
          category: 'technology',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
      case 6:
        getNews(
          category: 'health',
          country: AppConsts.countryCodes[defaultCountry]!['code']!,
        );
    }
    emit(ChangeCurrentIndexState());
  }

  //app info
  String version = "";

  void getAppInfo() {
    PackageInfo.fromPlatform().then((value) {
      version = value.version;
      emit(GetAppInfoState());
    });
  }

  //dark mode

  bool darkMode = false;

  void changeDarkMode() {
    darkMode = !darkMode;
    emit(ChangeDarkModeState());
  }

  String defaultCountry = "Egypt";
  String flag = "🇪🇬";

  void changeCountry(String country) {
    defaultCountry = country;
    flag = AppConsts.countryCodes[defaultCountry]!['flag']!;
    getNews(country: AppConsts.countryCodes[defaultCountry]!['code']!);
    emit(ChangeCountryState());
  }

  //get news data
  final _dio = Dio();

  List<Articles> articles = [];

  void getNews({String category = 'general', String country = 'eg'}) {
    articles.clear();
    _dio.get(AppConsts.api(category, country)).then((value) {
      articles = List.from(value.data['articles'])
          .map((e) => Articles.fromJson(e))
          .toList();
      emit(GetNewsDataSuccessState());
    }).catchError((error) {
      emit(GetNewsDataErrorState());
    });
  }

  //get search data
  final searchCtrl = TextEditingController();
  List<Articles> resultsOfSearch = [];

  void getSearchData() {
    emit(LoadingSearchCtrlState());
    resultsOfSearch = articles
        .where((element) => element.title.contains(searchCtrl.text))
        .toList();

    emit(ChangeSearchCtrlState());
  }
}

abstract class AppStates {}

class AppStateInitial extends AppStates {}

//bottom app bar
class ChangeCurrentIndexState extends AppStates {}

//app info
class GetAppInfoState extends AppStates {}

//dark mode
class ChangeDarkModeState extends AppStates {}

//language
class ChangeLanguageState extends AppStates {}

//news
class GetNewsDataSuccessState extends AppStates {}

class GetNewsDataErrorState extends AppStates {}

class ChangeCountryState extends AppStates {}

//search
class LoadingSearchCtrlState extends AppStates {}

class ChangeSearchCtrlState extends AppStates {}
