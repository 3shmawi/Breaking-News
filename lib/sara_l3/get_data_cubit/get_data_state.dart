part of 'get_data_cubit.dart';

abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetDataFromApiLoadingState extends GetDataState {}

class GetDataFromApiSuccessState extends GetDataState {}

class GetDataFromApiErrorState extends GetDataState {
  final String error;

  GetDataFromApiErrorState(this.error);
}


class DecrementState extends GetDataState {}

class ResetState extends GetDataState {}
