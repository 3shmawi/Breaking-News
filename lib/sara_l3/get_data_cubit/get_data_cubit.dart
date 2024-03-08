import 'package:c3/sara_l3/constants.dart';
import 'package:c3/sara_l3/model/azkar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/usr.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  final dio = Dio();

  int counter = 0;

  int total = 0;
  Map<String, dynamic> data = {};
  UserModel? userData;
  Azkar? azkar;

  void getData() {
    emit(GetDataFromApiLoadingState());
    dio.get(AppConsts.azkarUrl).then((value) {
      azkar = Azkar.fromJson(value.data);
      counter = int.parse(azkar!.count);
      total = int.parse(azkar!.count);
      emit(GetDataFromApiSuccessState());
    }).catchError((error) {
      if (azkar == null) {
        getData();
      }
      emit(GetDataFromApiErrorState(error.toString()));
    });
  }

  void rest() {
    counter = total;
    emit(ResetState());
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      emit(DecrementState());
    } else {
      getData();
    }
  }
}
