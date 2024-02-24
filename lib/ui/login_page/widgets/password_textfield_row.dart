import 'package:flutter/material.dart';
import 'package:fmr_test/styles/fmr_colors.dart';
import 'package:fmr_test/styles/text_styles.dart';
import 'package:pinput/pinput.dart';

class PasswordTextFieldRow extends StatelessWidget {
  const PasswordTextFieldRow({super.key, required this.length, required this.onCompleted, required this.controller, required this.enabled});

  final int length;
  final VoidCallback onCompleted;
  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: FMRColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      controller: controller,
      enabled: enabled,
      onCompleted: (pin) => onCompleted.call(),
      autofocus: true,
      length: length,
    );
  }
}

