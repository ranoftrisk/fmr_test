part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageEvent {}

class LoginPageEventInitInput extends LoginPageEvent {
  final TextEditingController controller;
  final int toPage;

  LoginPageEventInitInput({
    required this.controller,
    required this.toPage,
  });
}

class LoginPageEventOnPinInput extends LoginPageEvent {}

class LoginPageEventOnCountdownComplete extends LoginPageEvent {}

class LoginPageEventOnContinueTap extends LoginPageEvent {
  final String pin;

  LoginPageEventOnContinueTap({required this.pin});

}