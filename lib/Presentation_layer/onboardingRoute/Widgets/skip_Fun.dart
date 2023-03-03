import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';

import '../../resources/Strings_Manager.dart';
import '../../resources/Theme_Manager.dart';
import '../../resources/constants_Manager.dart';

class SkIPFun extends StatelessWidget {
  final int currentIndex;
  final CarouselController carouselController;
  const SkIPFun(
      {required this.carouselController,
      required this.currentIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          currentIndex == AppConstants.onboardingNumberOfPages - 1
              // -1 Because cureent index is 3.. but on boarding number is 4..
              // Counting starts from Zero in Programmign..
              ? AppStrings.skip
              : AppStrings.next,
          textAlign: TextAlign.end,
          style: GetApplicationTheme().textTheme.titleMedium,
        ),
        onPressed: () {
          currentIndex == AppConstants.onboardingNumberOfPages - 1
              ? Navigator.pushReplacementNamed(context, routes.mainRoute)
              // Navigate to Main Screen.. Because it's final screen on OnBoarding..
              : carouselController.nextPage();
          // Next Page Navigates to Next Screen on OnBoarding..
        },
      ),
    );
  }
}
