import 'package:dolist/pages/onboarding/onboarding_first_slide.dart';
import 'package:dolist/pages/onboarding/onboarding_second_slide.dart';
import 'package:dolist/pages/onboarding/onboarding_third_slide.dart';
import 'package:flutter/material.dart';
import 'package:dolist/theme/app_colors.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  String _homeRoute = '/home';

  final List<Widget> _slides = [
    OnboardingFirstSlide(),
    OnboardingSecondSlide(),
    OnboardingThirdSlide()
  ];

  void updateCurrentPage(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 212,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _currentPage == 0 ? AppColors.secondary : AppColors.gray,
                    borderRadius: BorderRadius.circular(1000)
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _currentPage == 1 ? AppColors.secondary : AppColors.gray,
                    borderRadius: BorderRadius.circular(1000)
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _currentPage == 2 ? AppColors.secondary : AppColors.gray,
                    borderRadius: BorderRadius.circular(1000)
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            GestureDetector(
              onTap: () {
                 _currentPage == _slides.length - 1 ? Navigator.pushNamed(context, _homeRoute) : _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Text(
                  _currentPage == _slides.length - 1 ? "Start using DoList" : "Continue",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 18,
                    fontVariations: [
                      FontVariation('wght', 700)
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, _homeRoute),
                child: Text(
                  "Skip for now",
                  style: TextStyle(
                    color: AppColors.grayText,
                    fontSize: 18,
                    fontVariations: [
                      FontVariation('wght', 700)
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _slides.length,
        onPageChanged: (index) => updateCurrentPage(index),
        itemBuilder: (context, index) {
          return _slides[index];
        },
      )
    );
  }
}