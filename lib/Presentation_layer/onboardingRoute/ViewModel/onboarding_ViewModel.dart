import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/Base/base_viewModel.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/View/onbarding_view.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/constants_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';

import '../../resources/Color_Manager.dart';
import '../../resources/Strings_Manager.dart';
import '../../resources/Value_Manager.dart';
import '../../resources/assets_Manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  // Stream Controller..
  final StreamController _streamController = StreamController();
  final PageController pageController = PageController();

  // Input Controller..

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    getData();
    postDataToUI(currentIndex);
  }

  @override
  void goNext(context) {
    // Move The Caroussel Slider To NextPage..
    // Navigate to Main Screen.. Because it's final screen on OnBoarding..
    currentIndex == AppConstants.onboardingNumberOfPages - 1
        ? Navigator.pushReplacementNamed(context, routes.mainRoute)
        : pageController.nextPage(
            duration: const Duration(milliseconds: 10),
            curve: Curves.bounceInOut,
          );
    // Next Page Navigates to Next Screen on OnBoardin
  }

  @override
  void goPrevious() {
    // Move The Caroussel Slider To PreviousPage..
    // Navigate to Main Screen.. Because it's final screen on OnBoarding..

    currentIndex == 0
        ? pageController.jumpToPage(0)
        : pageController.previousPage(
            duration: const Duration(milliseconds: 10),
            curve: Curves.bounceInOut,
          );
    // Next Page Navigates to Next Screen on OnBoardin
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    nextButton();
    postDataToUI(currentIndex);
  }

// onboarding Private Section..
  int currentIndex = 0;

  Map tempMap = {};

  // Create the starting fun..
  postDataToUI(int index) {
    // Stream Listening..
    inputViewObjectOnBoarding.add(tempMap[index]);
  }

  getData() {
    for (int i = 0; i <= AppConstants.onboardingNumberOfPages; i++) {
      List tempListOfData = [];
      if (i == 0) {
        tempListOfData.addAll([
          AppStrings.onBoardingTitle0,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingImage1
        ]);
        tempMap.addAll({0: tempListOfData});
      }
      if (i == 1) {
        tempListOfData.addAll([
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingImage2,
        ]);
        tempMap.addAll({1: tempListOfData});
      }
      if (i == 2) {
        tempListOfData.addAll([
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingImage3,
        ]);
        tempMap.addAll({2: tempListOfData});
      }
      if (i == 3) {
        tempListOfData.addAll([
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingImage4,
        ]);
        tempMap.addAll({3: tempListOfData});
      } else {
        // In Case We edited number of splash pages..
      }
    }
  }

  @override
  String nextButton() {
    if (currentIndex == AppConstants.onboardingNumberOfPages - 1) {
      return AppStrings.skip;
    } else {
      return AppStrings.next;
    }
  }

  // Sinking..

  @override
  // TODO: implement onboardingViewModelSink
  Sink get inputViewObjectOnBoarding => _streamController.sink;

  // Output Controller..

  @override
  // TODO: implement outputViewObjectOnBoarding
  Stream get outputViewObjectOnBoarding =>
      _streamController.stream.map((event) => event);
}

// Represents Orders Received by ViewModel from view..
abstract class OnboardingViewModelInputs {
  // To Go TO next Page When User clicks right arrow or swipe..

  void goNext(context);

  // To Go TO previous Page When User clicks left arrow or swipe..

  void goPrevious();

  // To Go TO Page When User clicks left arrow or swipe..

  void onPageChanged(int index);

  void nextButton();

  // Sink for stream Controller Input..

  Sink get inputViewObjectOnBoarding;
}

abstract class OnboardingViewModelOutputs {
  // Sink for stream Controller Output..

  Stream get outputViewObjectOnBoarding;
}
