import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/forgetPasswordRoute/forgetPassword_view.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/loginRoute/login_View.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/mainRoute/mainView.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/onboardingRoute/View/onbarding_view.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/registerRoute/register_view.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Strings_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/routes_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/splashRoute/splash_view.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/storeDetailsRoute/storeDetailsView.dart';

class routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/registerRoute";
  static const String forgetPasswordRoute = "/forgetPasswordRoute";
  static const String mainRoute = "/mainRoute";
  static const String onBording = "/onboardingRoute";
  static const String storeDetailsRoute = "/storeDetailsRoute";
}

class routeManager {
  static Route<dynamic> getroute(RouteSettings settings) {
    switch (settings.name) {
      case routes.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => const SplashView());
        }
      case routes.onBording:
        {
          return MaterialPageRoute(builder: (_) => const Onboarding_view());
        }
      case routes.loginRoute:
        {
          return MaterialPageRoute(builder: (_) => const LoginView());
        }
      case routes.registerRoute:
        {
          return MaterialPageRoute(builder: (_) => const registerView());
        }
      case routes.forgetPasswordRoute:
        {
          return MaterialPageRoute(builder: (_) => const forgetPasswordView());
        }
      case routes.mainRoute:
        {
          return MaterialPageRoute(builder: (_) => const main_view());
        }
      case routes.storeDetailsRoute:
        {
          return MaterialPageRoute(builder: (_) => const storeDetails_View());
        }
      default:
        return UndefinedWidget();
    }
  }
}

Route<dynamic> UndefinedWidget() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.noRoute),
            ),
          ));
}
