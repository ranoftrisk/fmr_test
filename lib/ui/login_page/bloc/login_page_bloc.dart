import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fmr_test/repo/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../generics/fmr_elevated_button.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  bool _showError = false;
  FMRElevatedButtonState buttonState = FMRElevatedButtonState.disabled;
  bool isPinEnabled = true;
  final AuthRepo _authRepo;

  LoginPageBloc(this._authRepo)
      : super(LoginPageInitial(
            showError: false,
            buttonState: FMRElevatedButtonState.disabled,
            isPinEnabled: true)) {
    on<LoginPageEventInitInput>(_loginPageEventInitInput);
    on<LoginPageEventOnPinInput>(_loginPageEventOnPinInput);
    on<LoginPageEventOnContinueTap>(_loginPageEventOnContinueTap);
    on<LoginPageEventOnCountdownComplete>(_loginPageEventRefreshTimer);
  }

  FutureOr<void> _loginPageEventInitInput(
      LoginPageEventInitInput event, Emitter<LoginPageState> emit) {
    event.controller.clear();
    _showError = false;
    buttonState = FMRElevatedButtonState.disabled;
    isPinEnabled = true;
    emit(_refreshUI());
  }

  LoginPageStateRefreshState _refreshUI() => LoginPageStateRefreshState(
      showError: _showError,
      buttonState: buttonState,
      isPinEnabled: isPinEnabled);

  FutureOr<void> _loginPageEventOnContinueTap(
      LoginPageEventOnContinueTap event, Emitter<LoginPageState> emit) async {
    final pin = event.pin;
    final didAuth = await _authRepo.checkPin(pin); // mock pin ofcourse
    if (didAuth) {
      emit(LoginPageNavToEmptyPageState(
          showError: _showError,
          buttonState: buttonState,
          isPinEnabled: isPinEnabled));
    } else {
      _lockScreen();
      emit(_refreshUI());
    }
  }

  void _lockScreen() {
    _showError = true;
    isPinEnabled = false;
    buttonState = FMRElevatedButtonState.disabled;
  }

  FutureOr<void> _loginPageEventOnPinInput(
      LoginPageEventOnPinInput event, Emitter<LoginPageState> emit) {
    buttonState = FMRElevatedButtonState.enabled;
    emit(_refreshUI());
  }

  FutureOr<void> _loginPageEventRefreshTimer(
      LoginPageEventOnCountdownComplete event, Emitter<LoginPageState> emit) {
    buttonState = FMRElevatedButtonState.disabled;
    isPinEnabled = false;
    emit(_refreshUI());
  }
}
