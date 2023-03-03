import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/ViewModel/onboarding_ViewModel.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/Widgets/onboarding_Widget.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Strings_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/constants_Manager.dart';

class Onboarding_view extends StatelessWidget {
  const Onboarding_view({super.key});
  static int CurrentIndex = 0;
  static CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: AppConstants.onboardingNumberOfPages,
      itemBuilder: (context, index, realIndex) {
        return OnBoardingWidget(
          carouselController: carouselController,
        );
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          CurrentIndex = index;
        },
        height: MediaQuery.of(context).size.height,
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: 1,
      ),
      carouselController: carouselController,
    );
  }
}
