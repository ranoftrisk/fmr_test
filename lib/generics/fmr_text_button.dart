import 'package:flutter/material.dart';
import 'package:fmr_test/styles/text_styles.dart';

class FMRTextButton extends StatelessWidget {
  const FMRTextButton({super.key, required this.onPressed, required this.caption});

  final VoidCallback onPressed;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(caption, style: FMRTextStyles.fmrTextButtonStyle, ));
  }
}
