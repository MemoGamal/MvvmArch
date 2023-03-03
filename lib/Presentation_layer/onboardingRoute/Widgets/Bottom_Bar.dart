import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';

import '../../resources/Color_Manager.dart';
import '../../resources/Value_Manager.dart';
import '../../resources/assets_Manager.dart';
import '../../resources/constants_Manager.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final CarouselController carouselController;
  const BottomBar({
    required this.carouselController,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return // BottomBar..
        Container(
      height: AppSize.s50,
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Arrow..
          Padding(
            padding: const EdgeInsets.only(left: AppPading.p14),
            child: InkWell(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.leftArrow,
                  color: ColorManager.white,
                ),
              ),
              onTap: () {
                carouselController.previousPage();
              },
            ),
          ),

          // CircleIndicators..
          Row(
            children: [
              for (int i = 0; i < AppConstants.onboardingNumberOfPages; i++)
                if (i == currentIndex)
                  Padding(
                    padding: const EdgeInsets.all(AppPading.p10),
                    child: SvgPicture.asset(
                      ImageAssets.hollowCircleIc,
                      color: ColorManager.white,
                      height: AppSize.s10,
                      width: AppSize.s10,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(AppPading.p10),
                    child: SvgPicture.asset(
                      ImageAssets.solidCircleIc,
                      color: ColorManager.white,
                      height: AppSize.s10,
                      width: AppSize.s10,
                      fit: BoxFit.cover,
                    ),
                  ),
            ],
          ),

          //Right Arrow..
          Padding(
            padding: const EdgeInsets.only(right: AppPading.p14),
            child: InkWell(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.rightArrow,
                  color: ColorManager.white,
                ),
              ),
              onTap: () {
                carouselController.nextPage();
                if (currentIndex == AppConstants.onboardingNumberOfPages - 1) {
                  Navigator.of(context).pushReplacementNamed(routes.mainRoute);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
