import 'dart:async';
import 'package:flutter/material.dart';
import 'package:first_anim_task/model/on_boarding_model.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingData data;
  final bool isFirstPage;
  final bool twoLine;
  const OnboardingPage({
    super.key,
    required this.data,
    this.isFirstPage = false,
    this.twoLine=false,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late bool _isVisible;
  bool _isSettled = false;

  @override
  void initState() {
    super.initState();
    // Question starts visible and in position for all pages except the first one
    _isVisible = !widget.isFirstPage;

    if (widget.isFirstPage) {
      // First page (Green): Delay, then animate from bottom
      Timer(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isVisible = true;
          });
          Timer(const Duration(milliseconds: 1000), () {
            if (mounted) {
              setState(() {
                _isSettled = true;
              });
            }
          });
        }
      });
    } else {
      // Subsequent pages: Already at initial position, just wait to settle
      Timer(const Duration(milliseconds: 1000), () {
        if (mounted) {
          setState(() {
            _isSettled = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const horizontalPadding = 35.0;

    final centerY = screenHeight / 2;
    final initialTop = centerY - 50;
    final finalTop = centerY - 150;
    final contentTwoLineTop = centerY - 60;
    final contentTop = centerY - 50;

    return Container();
  }
}