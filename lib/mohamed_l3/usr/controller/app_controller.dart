import 'package:c3/mohamed_l3/usr/model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppController extends Cubit<AppStates> {
  AppController() : super(InitialState());

  final Dio _dio = Dio();

  UserModel? model;

  void getUserData() {
    emit(DataLoadingState());
    _dio.get("https://randomuser.me/api/").then((value) {
      model = UserModel.fromJson(value.data);
      emit(DataSuccessState());
    }).catchError((error) {
      emit(DataErrorState(error.toString()));
    });
  }
}

// ----------------------------------------------------------------
// ----------------------------------------------------------------
abstract class AppStates {}

class InitialState extends AppStates {}

class DataLoadingState extends AppStates {}

class DataSuccessState extends AppStates {}

class DataErrorState extends AppStates {
  final String errorMsg;

  DataErrorState(this.errorMsg);
}
