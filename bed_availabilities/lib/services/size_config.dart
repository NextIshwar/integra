import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth,
      screenHeight,
      blockSizeHorizontal,
      blockSizeVertical,
      _safeAreaHorizontal,
      _safeAreaVertical,
      safeBlockHorizontal,
      safeBlockVertical,
      refMobileHeight,
      refMobileWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    refMobileHeight = 760;
    refMobileWidth = 360;

    if (screenHeight < 1200) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;
    }
  }

  static double getMobileWidthRatio(double val) {
    double res = (val / refMobileWidth) * 100;
    return res * blockSizeHorizontal;
  }

  static double getMobileHeightRatio(double val) {
    double res = (val / refMobileHeight) * 100;
    return res * blockSizeVertical;
  }

  static double getMobileFontRatio(double val) {
    double res = (val / refMobileWidth) * 100;
    if (screenWidth < screenHeight) {
      return res * safeBlockHorizontal;
    } else {
      return res * safeBlockVertical;
    }
  }
}

extension SizeUtils on num {
  double get toWidth => SizeConfig.getMobileWidthRatio(toDouble());

  double get toHeight => SizeConfig.getMobileHeightRatio(toDouble());

  double get toFont => SizeConfig.getMobileFontRatio(toDouble());
}
