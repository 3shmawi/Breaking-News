part of 'usr_cubit.dart';

abstract class UsrState {}

class UsrInitial extends UsrState {}

class UsrLoadingState extends UsrState {}

class UsrSuccessState extends UsrState {}

class UsrErrorState extends UsrState {
  UsrErrorState({
    required this.msgError,
  });

  final String msgError;
}
