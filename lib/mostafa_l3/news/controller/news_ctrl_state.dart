part of 'news_ctrl_cubit.dart';

abstract class NewsCtrlState {}

class NewsCtrlInitial extends NewsCtrlState {}

class ChangeThemeState extends NewsCtrlState {}

class ChangeIndexState extends NewsCtrlState {}

class NewsCtrlLoading extends NewsCtrlState {}

class NewsCtrlSuccess extends NewsCtrlState {}

class NewsCtrlError extends NewsCtrlState {
  final String message;

  NewsCtrlError(this.message);
}
