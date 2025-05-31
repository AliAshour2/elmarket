import 'package:elmarket/core/resources/color_manager.dart';
import 'package:elmarket/core/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getLightStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getTextWithLine() {
  return TextStyle(
    color: ColorManager.primary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    decorationColor: ColorManager.primary,
  );
}
