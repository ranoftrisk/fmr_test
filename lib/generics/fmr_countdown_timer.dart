import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:fmr_test/styles/fmr_colors.dart';
import 'package:fmr_test/styles/text_styles.dart';

class FMRCountdownTimer extends StatelessWidget {
  const FMRCountdownTimer({super.key, required this.onComplete, required this.duration});

  final VoidCallback onComplete;
  final int duration;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final countdownSize = width * 0.25;
    return CircularCountDownTimer(
      width: countdownSize,
      height: countdownSize,
      duration: duration,
      fillColor: FMRColors.primaryColor,
      ringColor: Colors.transparent,
      isReverse: true,
      isReverseAnimation: true,
      textStyle: FMRTextStyles.fmrTextButtonStyle,
      onComplete: onComplete,
    );
  }
}
