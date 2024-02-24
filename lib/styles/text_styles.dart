import 'package:flutter/material.dart';
import 'package:fmr_test/styles/fmr_colors.dart';

class FMRTextStyles {
  static const TextStyle elevatedEnabledTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle elevatedDisableTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle errorTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.redAccent,
  );
  static const TextStyle fmrTextButtonStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: FMRColors.primaryColor,
  );
}
