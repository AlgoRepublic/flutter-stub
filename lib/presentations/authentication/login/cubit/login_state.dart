part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ProcessingState extends LoginState {}

class AlertMsgState extends LoginState {
  final bool isForError;
  final String msg;

  AlertMsgState({this.isForError = false, required this.msg});
}
