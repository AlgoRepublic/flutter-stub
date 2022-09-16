part of 'authentication_cubit_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class ProcessingState extends AuthenticationState {}

class AlertMessageState extends AuthenticationState {
  final bool isForError;
  final String msg;

  AlertMessageState({this.isForError = false, required this.msg});
}
