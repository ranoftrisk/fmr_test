import 'package:flutter/material.dart';
import 'package:fmr_test/generics/fmr_countdown_timer.dart';
import 'package:fmr_test/generics/fmr_elevated_button.dart';
import 'package:fmr_test/generics/fmr_text_button.dart';
import 'package:fmr_test/styles/text_styles.dart';
import 'package:fmr_test/styles/theme_data.dart';
import 'package:fmr_test/ui/login_page/widgets/password_textfield_row.dart';

class LoginPageInsertCodePage extends StatelessWidget {
  const LoginPageInsertCodePage(
      {super.key,
      required this.onPinInsert,
      required this.pinController,
      required this.displayError,
      required this.buttonState,
      required this.sendAgain,
      required this.onCountdownComplete,
      required this.enabledPassword,
      required this.onContinueTap});

  final VoidCallback onPinInsert;
  final VoidCallback sendAgain;
  final VoidCallback onContinueTap;
  final VoidCallback onCountdownComplete;
  final bool enabledPassword;
  final TextEditingController pinController;
  final bool displayError;
  final FMRElevatedButtonState buttonState;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            "נא להזין את הקוד הסודי שנשלח אליך במסרון או בהודעה קולית לטלפון הנייד שלך",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: textTheme.displayMedium,
          ),
          const SizedBox(
            height: 18,
          ),
          PasswordTextFieldRow(
            length: 6,
            enabled: enabledPassword,
            controller: pinController,
            onCompleted: onPinInsert,
          ),
          const SizedBox(
            height: 18,
          ),
          if (displayError)
            const Text(
              "קוד שגוי",
              style: FMRTextStyles.errorTextStyle,
              textAlign: TextAlign.end,
            ),
          const SizedBox(
            height: 32,
          ),
          FMRElevatedButton(
              onPressed: onContinueTap,
              buttonState: buttonState,
              caption: "המשך"),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FMRTextButton(
                onPressed: sendAgain,
                caption: "שלח לי שוב",
              ),
              Text(
                "לא קיבלתי",
                style: textTheme.bodyMedium,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          FMRCountdownTimer(
            duration: 120,
            onComplete: onCountdownComplete,
          )
        ],
      ),
    );
  }
}
