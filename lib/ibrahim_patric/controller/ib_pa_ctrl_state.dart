part of 'ib_pa_ctrl_cubit.dart';

abstract class IbPaCtrlState {}

class IbPaCtrlInitial extends IbPaCtrlState {}

class GetNewLoadingState extends IbPaCtrlState {}

class GetNewSuccessState extends IbPaCtrlState {}

class GetNewErrorState extends IbPaCtrlState {}

class GetSearchState extends IbPaCtrlState {}
