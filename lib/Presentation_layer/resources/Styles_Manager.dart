import 'package:flutter/cupertino.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Font_Manager.dart';

TextStyle _getTextStyle(
  double fontsize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontsize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Regular Style..
TextStyle getRegularStyle(
    {double fontsize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.regular,
    color,
  );
}

// Bold Style..
TextStyle getBoldStyle({double fontsize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.bold,
    color,
  );
}

// Semi-Bold Style..
TextStyle getSemiBoldStyle(
    {double fontsize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.semiBold,
    color,
  );
}

// Medium Style..

TextStyle getMediumStyle(
    {double fontsize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.medium,
    color,
  );
}

// Light Style..

TextStyle getLightStyle(
    {double fontsize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontsize,
    FontWeightManager.light,
    color,
  );
}
