import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/mainRoute/view/mainView.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/ViewModel/onboarding_ViewModel.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Strings_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/constants_Manager.dart';

import '../../resources/Color_Manager.dart';
import '../../resources/Value_Manager.dart';
import '../Widgets/Bottom_Bar.dart';
import '../Widgets/skip_Fun.dart';

class onboarding_view extends StatefulWidget {
  const onboarding_view({super.key});
  static final CarouselController carouselController = CarouselController();

  @override
  State<onboarding_view> createState() => _onboarding_viewState();
}

class _onboarding_viewState extends State<onboarding_view> {
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
    return StreamBuilder(
      stream: onboardingViewModel.outputViewObjectOnBoarding,
      builder: (context, snapshot) {
        return carouselWidget(context, snapshot.data, onboardingViewModel);
      },
    );
  }
}

// _getContentWidget is Widget for UI.. Seperated From Logic..
Widget carouselWidget(BuildContext context, data, onboardingViewModel) {
  return PageView.builder(
    itemCount: AppConstants.onboardingNumberOfPages,
    onPageChanged: (value) {
      onboardingViewModel.onPageChanged(value);
    },
    itemBuilder: (context, index) {
      return _getContentWidget(context, data, onboardingViewModel);
    },
    controller: onboardingViewModel.pageController,
  );
}

Widget _getContentWidget(BuildContext context, data, onboardingViewModel) {
  final CarouselController carouselController = CarouselController();
  if (data == null) {
    return Container();
  } else {
    return Scaffold(
      backgroundColor: ColorManager.white,
      //AppBar..
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.black,
          statusBarBrightness: Brightness.light,
        ),
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
      ),
      // BottomSheet..
      bottomSheet: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SkIPFun(
              onboardingViewModel: onboardingViewModel,
            ),
            BottomBar(
              currentIndex: onboardingViewModel.currentIndex,
              onboardingViewModel: onboardingViewModel,
            ),
          ],
        ),
      ),
      // Body..
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppPading.p40),
            ),
            Text(
              data[0],
              // Zero Because it's first item in list Pushed In Stream..
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Padding(
              padding: EdgeInsets.all(AppPading.p8),
            ),
            Text(
              data[1],
              // one Because it's 2nd item in list Pushed In Stream..

              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Padding(
              padding: EdgeInsets.all(AppPading.p8),
            ),
            SvgPicture.asset(
              data[2],
              // 2 Because it's Third item in list Pushed In Stream..
            ),
          ],
        ),
      ),
    );
  }
}
