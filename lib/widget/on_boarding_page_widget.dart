import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    return Container(
      color: widget.data.backgroundColor,
      width: double.infinity,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutQuart,
            left: horizontalPadding,
            right: horizontalPadding,
            top: !_isVisible
                ? screenHeight
                : (_isSettled ? finalTop : initialTop),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: _isVisible ? 1.0 : 0.0,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutQuart,
                style: GoogleFonts.lexend(
                  color: _isSettled ? widget.data.questionTextColor : Colors.white,
                  fontSize: _isSettled ? 26 : 30,
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                  letterSpacing: 0,
                ),
                child: Text(widget.data.question),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuart,
            left: _isSettled ? horizontalPadding : screenWidth,
            top: widget.twoLine?contentTwoLineTop:contentTop,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isSettled ? 1.0 : 0.0,
              child: SizedBox(
                width: screenWidth - (horizontalPadding * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.answer,
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                        height: 1.0,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.data.detail,
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        height: 36 / 32,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}