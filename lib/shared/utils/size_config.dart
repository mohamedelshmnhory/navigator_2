import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static Size? size;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    if (_mediaQueryData == null) {
      _mediaQueryData = MediaQuery.of(context);
      size = _mediaQueryData!.size;
      screenWidth = _mediaQueryData!.size.width;
      screenHeight = _mediaQueryData!.size.height;
      blockSizeHorizontal = (screenWidth! / 100);
      blockSizeVertical = screenHeight! / 100;
      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
      safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
    }
  }
}

double hSpace(double value) {
  return SizeConfig.safeBlockHorizontal! * value;
}

double vSpace(double value) {
  return SizeConfig.safeBlockVertical! * value;
}

double getFontSize(double value) {
  return SizeConfig.safeBlockHorizontal! * value;
}
