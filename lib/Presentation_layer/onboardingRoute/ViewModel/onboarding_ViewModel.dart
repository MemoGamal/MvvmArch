import 'dart:async';

import 'package:mvvm_clean_architicture/Presentation_layer/Base/base_viewModel.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/View/onbarding_view.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/constants_Manager.dart';

import '../../resources/Strings_Manager.dart';
import '../../resources/assets_Manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  // Stream Controller..
  final StreamController _streamController = StreamController();

  // Input Controller..

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    getData();
    postDataToUI();
  }

  @override
  void goNext() {
    // Move The Caroussel Slider To NextPage..
    Onboarding_view.carouselController.nextPage();
  }

  @override
  void goPrevious() {
    // Move The Caroussel Slider To NextPage..
    Onboarding_view.carouselController.previousPage();
  }

  @override
  void onPageChanged(int index) {
    currentIndex = Onboarding_view.CurrentIndex;
  }

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

  void goNext();

  // To Go TO previous Page When User clicks left arrow or swipe..

  void goPrevious();

  // To Go TO Page When User clicks left arrow or swipe..

  void onPageChanged(int index);
  // Sink for stream Controller Input..

  Sink get inputViewObjectOnBoarding;

  // onboarding Private Section..
  int currentIndex = 0;
  Map tempMap = {};

  // Create the starting fun..
  postDataToUI() {
    inputViewObjectOnBoarding.add(tempMap);
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
      }
    }
  }
}

abstract class OnboardingViewModelOutputs {
  // Sink for stream Controller Output..

  Stream get outputViewObjectOnBoarding;

  void Test() {
    outputViewObjectOnBoarding.forEach((element) {print(element)});
  }
}
