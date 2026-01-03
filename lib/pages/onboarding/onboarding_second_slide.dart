import 'package:flutter/material.dart';
import 'package:dolist/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSecondSlide extends StatelessWidget {
  const OnboardingSecondSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondary.withAlpha(30),
                      blurRadius: 60,
                    ),
                    BoxShadow(
                      color: AppColors.secondary.withAlpha(40),
                      blurRadius:160,
                      offset: Offset(0, 80)
                    )
                  ]
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/neurology.svg",
                    width: 65,
                  )
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Power of intelligence",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontVariations: [
                          FontVariation('wght', 800),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Experience a to-do list that thinks ahead and grow with you',
                      style: TextStyle(
                        color: AppColors.grayText,
                        fontSize: 16,
                        height: 1.9
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Feature Card 1: Efficient Organization
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.circular(16),
                        border: BoxBorder.all(
                          color: Color(0xFF242525),
                          width: 0.9
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xFF141D35),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/category.svg',
                            )
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Efficient Organization",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontVariations: [
                                      FontVariation('wght', 700),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Streamline your daily tasks with powerful categorization and sorting tools for ultimate clarity and control.",
                                  style: TextStyle(
                                    color: AppColors.grayText,
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Feature Card 2: Visual Progress
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF111111),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xFF1A1932),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset('assets/icons/donut_large.svg')
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Visual Progress",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontVariations: [
                                      FontVariation('wght', 700),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Track your daily momentum with beautiful charts and insights.",
                                  style: TextStyle(
                                    color: AppColors.grayText,
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      )
    );
  }
}