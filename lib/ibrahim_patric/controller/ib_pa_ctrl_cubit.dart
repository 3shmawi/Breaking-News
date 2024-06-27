import 'package:c3/ibrahim_patric/model/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/config.dart';

part 'ib_pa_ctrl_state.dart';

class IbPaCtrlCubit extends Cubit<IbPaCtrlState> {
  IbPaCtrlCubit() : super(IbPaCtrlInitial());

  List<Articles> dataNews = [];

  final _dio = Dio();

  void getData() {
    emit(GetNewLoadingState());
    _dio.get(IPAppConf.apiUrl).then((value) {
      dataNews = List.from(value.data['articles'])
          .map((e) => Articles.fromJson(e))
          .toList();

      emit(GetNewSuccessState());
    }).catchError((error) {
      emit(GetNewErrorState());
    });
  }

  List<Articles> searchResults = [];

  void search(String value) {
    searchResults = dataNews
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()) ||
            element.description.toLowerCase().contains(value.toLowerCase()))
        .toList();
    emit(GetSearchState());
  }
}
