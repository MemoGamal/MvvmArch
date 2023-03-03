import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Color_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/assets_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/constants_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(
        const Duration(seconds: AppConstants.splashDelayDuration), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, routes.onBording);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashImagePath),
        ),
      ),
    );
  }
}
