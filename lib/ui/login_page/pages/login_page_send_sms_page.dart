import 'package:flutter/material.dart';
import 'package:fmr_test/generics/fmr_elevated_button.dart';
import 'package:fmr_test/styles/theme_data.dart';

class LoginPageSendSmsPage extends StatelessWidget {
  const LoginPageSendSmsPage({super.key, required this.onSendTap});

  final VoidCallback onSendTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          "שלחנו הודעה עם קוד חד פעמי לטלפון הנייד שלך",
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: textTheme.displayMedium,
        ),
        SizedBox(
          height: height * 0.15,
        ),
        Text(
          "054-****431",
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: FMRElevatedButton(
              onPressed: onSendTap,
              buttonState: FMRElevatedButtonState.enabled,
              caption: "שליחת קוד אימות"),
        ),
      ],
    );
  }
}
