
import 'package:flutter/material.dart';


class OnboardingData {
  final Color backgroundColor;
  final Color questionTextColor;
  final String question;
  final String answer;
  final String detail;
  final bool showSkip;

  OnboardingData({
    required this.backgroundColor,
    required this.questionTextColor,
    required this.question,
    required this.answer,
    required this.detail,
    this.showSkip = true,
  });
}