import 'package:flutter/material.dart';
import 'package:dolist/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingThirdSlide extends StatelessWidget {
  const OnboardingThirdSlide({super.key});

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
                    "assets/icons/rocket_launch.svg",
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
                      "You`re all set",
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
                      'Your intelligent workspace is ready. Dive in and start accomplishing more today with DoList',
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