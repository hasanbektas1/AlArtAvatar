import 'package:flutter/material.dart';
import 'package:alartavatar/constants/texts.dart';
import 'package:alartavatar/view/inapp/inapp_screen.dart';
import 'package:alartavatar/view/onboarding/custom_onboarding.dart';

class OnboardingPapes extends StatefulWidget {
  const OnboardingPapes({super.key});

  @override
  _OnboardingPapesState createState() => _OnboardingPapesState();
}

class _OnboardingPapesState extends State<OnboardingPapes> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  List<Color> lineColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          CustomOnboardingPage(
            imagePath: TextConstant.onboardingPage1Image,
            title: TextConstant.onboardingPage1title,
            description: TextConstant.onboardingPage1description,
            lineColors: const [
              Color(0xFF404040),
              Color(0xFF202020),
              Color(0xFF202020),
              Color(0xFF202020)
            ],
            buttonText: TextConstant.onboardingPagebuttonText,
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          CustomOnboardingPage(
            imagePath: TextConstant.onboardingPage2Image,
            title: TextConstant.onboardingPage2title,
            description: TextConstant.onboardingPage2description,
            lineColors: const [
              Color(0xFF202020),
              Color(0xFF404040),
              Color(0xFF202020),
              Color(0xFF202020)
            ],
            buttonText: TextConstant.onboardingPagebuttonText,
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          CustomOnboardingPage(
            imagePath: TextConstant.onboardingPage3Image,
            title: TextConstant.onboardingPage3title,
            description: TextConstant.onboardingPage3description,
            lineColors: const [
              Color(0xFF202020),
              Color(0xFF202020),
              Color(0xFF404040),
              Color(0xFF202020)
            ],
            buttonText: TextConstant.onboardingPagebuttonText,
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          CustomOnboardingPage(
            imagePath: TextConstant.onboardingPage4Image,
            title: TextConstant.onboardingPage4title,
            description: TextConstant.onboardingPage4description,
            lineColors: const [
              Color(0xFF202020),
              Color(0xFF202020),
              Color(0xFF202020),
              Color(0xFF404040)
            ],
            buttonText: TextConstant.onboardingPagebuttonText,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InappScreen()));
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
