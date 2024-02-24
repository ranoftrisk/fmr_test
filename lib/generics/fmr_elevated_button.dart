import 'package:flutter/material.dart';
import 'package:fmr_test/styles/fmr_colors.dart';
import 'package:fmr_test/styles/text_styles.dart';

class FMRElevatedButton extends StatelessWidget {
  const FMRElevatedButton(
      {super.key,
      required this.onPressed,
      required this.buttonState,
      required this.caption});

  final VoidCallback onPressed;
  final FMRElevatedButtonState buttonState;
  final String caption;

  @override
  Widget build(BuildContext context) {
    final isEnabled = buttonState == FMRElevatedButtonState.enabled;
    return ElevatedButton(
      onPressed: () {
        if (isEnabled) {
          onPressed.call();
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonState.getColor(),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8)),
      child: buttonState.getText(caption),
    );
  }
}

enum FMRElevatedButtonState {
  enabled,
  disabled,
}

extension FMRElevatedButtonStateStyle on FMRElevatedButtonState {
  Text getText(String text) {
    return switch (this) {
      FMRElevatedButtonState.enabled => Text(
          text,
          style: FMRTextStyles.elevatedEnabledTextStyle,
        ),
      FMRElevatedButtonState.disabled => Text(
          text,
          style: FMRTextStyles.elevatedDisableTextStyle,
        ),
    };
  }

  Color getColor() {
    return switch (this) {
      FMRElevatedButtonState.enabled => FMRColors.primaryColor,
      FMRElevatedButtonState.disabled =>
        FMRColors.elevatedDisableBackgroundColor,
    };
  }
}
