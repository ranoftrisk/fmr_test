import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmr_test/repo/auth_repo.dart';
import 'package:fmr_test/styles/theme_data.dart';
import 'package:fmr_test/ui/empty_page/empty_page.dart';
import 'login_page.dart';

class SMSLoginPageViewPage extends StatefulWidget {
  const SMSLoginPageViewPage({super.key});

  @override
  State<SMSLoginPageViewPage> createState() => _SMSLoginPageViewPageState();
}

class _SMSLoginPageViewPageState extends State<SMSLoginPageViewPage> {
  late PageController _controller;
  late TextEditingController _pinController;

  @override
  void initState() {
    _controller = PageController(initialPage: 1);
    _pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    return BlocProvider(
      create: (context) => LoginPageBloc(context.read<AuthRepo>()),
      child: BlocConsumer<LoginPageBloc, LoginPageState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case const (LoginPageNavToEmptyPageState):
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EmptyPage()));
          }
        },
        builder: (context, state) {
          final bloc = context.read<LoginPageBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: _buildExitButton(bloc),
                    ),
                    Center(
                      child: Text(
                        "קוד עימות",
                        style: textTheme.displayLarge,
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _controller,
                        itemBuilder: (context, index) {
                          if (index == 1) {
                            return _buildLoginPageSendSmsPage(bloc);
                          } else {
                            return _buildLoginPageInsertCodePage(bloc, state);
                          }
                        },
                        itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  IconButton _buildExitButton(LoginPageBloc bloc) {
    return IconButton(
      onPressed: () => _animateToPage(1, bloc),
      icon: const Icon(Icons.close),
    );
  }

  LoginPageSendSmsPage _buildLoginPageSendSmsPage(LoginPageBloc bloc) {
    return LoginPageSendSmsPage(onSendTap: () => _animateToPage(0, bloc));
  }

  LoginPageInsertCodePage _buildLoginPageInsertCodePage(
      LoginPageBloc bloc, LoginPageState state) {
    return LoginPageInsertCodePage(
      onContinueTap: () =>
          bloc.add(LoginPageEventOnContinueTap(pin: _pinController.text)),
      onPinInsert: () => bloc.add(LoginPageEventOnPinInput()),
      onCountdownComplete: () {
        FocusManager.instance.primaryFocus?.unfocus();
        bloc.add(LoginPageEventOnCountdownComplete());
      },
      sendAgain: () => _animateToPage(1, bloc),
      pinController: _pinController,
      displayError: state.showError,
      buttonState: state.buttonState,
      enabledPassword: state.isPinEnabled,
    );
  }

  void _animateToPage(int page, LoginPageBloc bloc) {
    FocusManager.instance.primaryFocus?.unfocus();
    bloc.add(LoginPageEventInitInput(controller: _pinController, toPage: page));
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}
