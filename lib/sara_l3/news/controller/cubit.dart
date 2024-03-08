import 'package:c3/sara_l3/news/config/configs.dart';
import 'package:c3/sara_l3/news/controller/states.dart';
import 'package:c3/sara_l3/news/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppController extends Cubit<AppStates> {
  AppController() : super(AppInitialState());

  final dio = Dio();

  NewsModel? newsModel;

  void getNewsData([String category = "business"]) {
    newsModel = null;
    emit(GetNewsDataLoadingState());
    dio.get(AppConfigs.getData(category)).then((response) {
      newsModel = NewsModel.fromJson(response.data);

      emit(GetNewsDataSuccessState());
    }).catchError((error) {
      emit(GetNewsDataErrorState());
    });
  }

  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }

  bool isMobile = false;
}
