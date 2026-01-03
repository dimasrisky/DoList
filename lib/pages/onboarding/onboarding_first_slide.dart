import 'package:flutter/material.dart';
import 'package:dolist/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingFirstSlide extends StatelessWidget {
  const OnboardingFirstSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondary.withAlpha(70),
                      blurRadius: 20,
                    )
                  ]
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/check_circle.svg",
                    width: 65,
                  )
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To DoList",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontVariations: [
                          FontVariation('wght', 800),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'The clean, intelligent workspace designed to bring clarity to your day.',
                      style: TextStyle(
                        color: AppColors.grayText,
                        fontSize: 18,
                        height: 1.9
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
      )
    );
  }
}