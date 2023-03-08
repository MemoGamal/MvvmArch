import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/ViewModel/onboarding_ViewModel.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';

import '../../resources/Strings_Manager.dart';
import '../../resources/Theme_Manager.dart';
import '../../resources/constants_Manager.dart';

class SkIPFun extends StatelessWidget {
  final onboardingViewModel;
  const SkIPFun({
    required this.onboardingViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          onboardingViewModel.nextButton(),
          textAlign: TextAlign.end,
          style: GetApplicationTheme().textTheme.titleMedium,
        ),
        onPressed: () {
          // carouselController.nextPage();
          onboardingViewModel.goNext(
            context,
          );
        },
      ),
    );
  }
}
