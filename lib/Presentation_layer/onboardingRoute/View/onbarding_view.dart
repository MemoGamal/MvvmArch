import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/ViewModel/onboarding_ViewModel.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Strings_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/constants_Manager.dart';

import '../../resources/Color_Manager.dart';
import '../../resources/Value_Manager.dart';
import '../Widgets/Bottom_Bar.dart';
import '../Widgets/skip_Fun.dart';

class Onboarding_view extends StatefulWidget {
  const Onboarding_view({super.key});
  static final CarouselController carouselController = CarouselController();

  @override
  State<Onboarding_view> createState() => _Onboarding_viewState();
}

class _Onboarding_viewState extends State<Onboarding_view> {
  // OnboardingViewModel is instance of Model To access Class Members.. Logic..

  static final OnboardingViewModel onboardingViewModel = OnboardingViewModel();

  //Binding Func..
  void _bind() {
    onboardingViewModel.start();
  }

  // Init to Start.. Logic..
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: AppConstants.onboardingNumberOfPages,
      itemBuilder: (context, index, realIndex) {
        return StreamBuilder(
          stream: onboardingViewModel.outputViewObjectOnBoarding,
          builder: (context, snapshot) {
            return _getContentWidget(
                context, snapshot.data, onboardingViewModel);
          },
        );
      },
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          onboardingViewModel.onPageChanged(index);
          print(onboardingViewModel.currentIndex);
        },
        height: MediaQuery.of(context).size.height,
        autoPlay: false,
        enableInfiniteScroll: false,
        viewportFraction: 1,
      ),
      carouselController: Onboarding_view.carouselController,
    );
  }
}

// _getContentWidget is Widget for UI.. Seperated From Logic..

Widget _getContentWidget(BuildContext context, data, onboardingViewModel) {
  print(
      "onboardingViewModel.currentIndex is ${onboardingViewModel.currentIndex}");
  final CarouselController carouselController = CarouselController();
  if (data == null) {
    return Container();
  } else {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.black,
          statusBarBrightness: Brightness.light,
        ),
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
      ),
      bottomSheet: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SkIPFun(
              currentIndex: onboardingViewModel.currentIndex,
              carouselController: carouselController,
            ),
            BottomBar(
              currentIndex: onboardingViewModel.currentIndex,
              carouselController: carouselController,
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppPading.p40),
            ),
            Text(
              data[0][0],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Padding(
              padding: EdgeInsets.all(AppPading.p8),
            ),
            Text(
              data[1][0],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Padding(
              padding: EdgeInsets.all(AppPading.p8),
            ),
            SvgPicture.asset(
              data[onboardingViewModel.currentIndex][2],
            ),
          ],
        ),
      ),
    );
  }
}
