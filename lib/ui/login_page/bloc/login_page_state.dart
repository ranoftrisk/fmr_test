part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageState {
  final bool showError;
  final FMRElevatedButtonState buttonState;
  final bool isPinEnabled;

  LoginPageState(
      {required this.showError,
      required this.buttonState,
      required this.isPinEnabled});
}

class LoginPageInitial extends LoginPageState {
  LoginPageInitial(
      {required super.showError,
      required super.buttonState,
      required super.isPinEnabled});
}

class LoginPageStateRefreshState extends LoginPageState {
  LoginPageStateRefreshState(
      {required super.showError,
      required super.buttonState,
      required super.isPinEnabled});
}

@immutable
abstract class LoginPageNavState extends LoginPageState{
  LoginPageNavState({required super.showError, required super.buttonState, required super.isPinEnabled});
}

class LoginPageNavToEmptyPageState extends LoginPageNavState{
  LoginPageNavToEmptyPageState({required super.showError, required super.buttonState, required super.isPinEnabled});
}
