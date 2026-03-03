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
  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }
}