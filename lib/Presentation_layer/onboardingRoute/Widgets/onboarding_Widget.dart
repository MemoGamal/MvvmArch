import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Color_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Strings_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Value_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/assets_Manager.dart';
import '../../resources/Theme_Manager.dart';
import 'Bottom_Bar.dart';
import 'skip_Fun.dart';

class OnBoardingWidget extends StatelessWidget {
  final CarouselController carouselController;
  const OnBoardingWidget({required this.carouselController, super.key});
  @override
  Widget build(BuildContext context) {
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
              currentIndex: currentIndex,
              carouselController: carouselController,
            ),
            BottomBar(
              currentIndex: currentIndex,
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
              onBoardingLargeText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Padding(
              padding: EdgeInsets.all(AppPading.p8),
            ),
            Text(
              onBoardingSubText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Padding(
              padding: EdgeInsets.all(AppPading.p8),
            ),
            SvgPicture.asset(onBoardingImagePath),
          ],
        ),
      ),
    );
  }
}
