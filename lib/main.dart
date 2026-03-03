import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:first_anim_task/model/on_boarding_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anim Task Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
       brightness: Brightness.light,
        textTheme: GoogleFonts.lexendTextTheme(),
        ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<OnboardingData> _pages = [
    OnboardingData(
      backgroundColor: const Color(0xFF27AE60),
      questionTextColor: const Color(0xFF053F1D),
      question: 'How much\nof my earnings\ndo I get to keep?',
      answer: '100%.',
      detail: 'We charge zero\ncommission on\nyour sales.',
      showSkip: false,
    ),

    OnboardingData(
      backgroundColor: const Color(0xFF2980B9),
      questionTextColor: const Color(0xFF05283F),
      question: 'Will I get paid\non time,\nand is it safe?',
      answer: 'Always.',
      detail: 'Payments are\nsecure and\non-time,\nevery time.',
    ),

    OnboardingData(
      backgroundColor: const Color(0xFF9B59B6),
      questionTextColor: const Color(0xFF280337),
      question: 'Can I reach more\ncustomers beyond\nmy area?',
      answer: 'Yes!',
      detail: 'We deliver to\n20,000+ pin codes\nacross India.',
    ),

    OnboardingData(
      backgroundColor: const Color(0xFFE67E22),
      questionTextColor: const Color(0xFF47260A),
      question: 'What if most of my\nsales happen offline?',
      answer: 'No worries',
      detail: 'offline exposure is\npart of the plan.',
    ),

    OnboardingData(
      backgroundColor: const Color(0xFFE74C3C),
      questionTextColor: const Color(0xFF4B0C05),
      question: 'How do I minimize\nreturns and losses?',
      answer: 'With us,',
      detail: 'you get fewer\nreturns and\nmore profit.',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _pages.length - 1) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        _currentPage = 0;
        _pageController.jumpToPage(_currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }

}