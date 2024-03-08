import 'package:c3/mostafa_l3/random_usr/config/data.dart';
import 'package:c3/mostafa_l3/random_usr/model/usr.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usr_state.dart';

class UsrCubit extends Cubit<UsrState> {
  UsrCubit() : super(UsrInitial());

  final _dio = Dio();

  RandoModel? model;

  void getUsrData() {
    emit(UsrLoadingState());

    _dio.get(AppConstants.url).then((value) {
      model = RandoModel.fromJson(value.data);
      emit(UsrSuccessState());
    }).catchError((error) {
      emit(UsrErrorState(msgError: error.toString()));
    });
  }
}
