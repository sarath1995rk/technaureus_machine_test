import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Sizes {
  static final double statusBarHeight =
      MediaQueryData.fromWindow(window).padding.top;

  static final double homeIndicatorHeight =
      MediaQueryData.fromWindow(window).viewPadding.bottom;

  //Icon Size
  static final double icon8 = 8.0.w;
  static final double icon12 = 12.0.w;
  static final double icon16 = 16.0.w;
  static final double icon20 = 20.0.w;
  static final double icon24 = 24.0.w;
  static final double icon28 = 28.0.w;
  static final double icon32 = 32.0.w;
  static final double icon36 = 36.0.w;
  static final double icon44 = 44.0.w;
  static final double icon52 = 52.0.w;
  static final double icon70 = 70.0.w;

  //Screen Margin
  static final double screenMarginV16 = 16.h;
  static final double screenMarginV20 = 20.h;
  static final double screenMarginH16 = 16.h;
  static final double screenMarginH28 = 28.h;
  static final double screenMarginH36 = 36.h;

  //Widget Padding
  static final double paddingV4 = 4.0.h;
  static final double paddingV8 = 8.0.h;
  static final double paddingV12 = 12.h;
  static final double paddingV16 = 16.h;
  static final double paddingV20 = 20.h;
  static final double paddingV24 = 24.h;
  static final double paddingV30 = 30.h;
  static final double paddingH4 = 4.0.h;
  static final double paddingH8 = 8.0.h;
  static final double paddingH12 = 12.h;
  static final double paddingH16 = 16.h;
  static final double paddingH20 = 20.h;
  static final double paddingH24 = 24.h;

  //Button
  static final double buttonHeight32 = 32.0.h;
  static final double buttonHeight38 = 38.0.h;
  static final double buttonHeight40 = 40.0.h;
  static final double buttonHeight44 = 44.0.h;
  static final double buttonHeight48 = 48.0.h;
  static final double buttonHeight52 = 50.0.h;
  static final double buttonHeight56 = 56.0.h;
  static final double buttonWidthP3 = 0.5.sw;
}

@immutable
class Corners {
  static final double radius5 = 5.0.h;
  static final double radius10 = 10.0.h;
  static final double radius20 = 20.0.h;
  static final double radius30 = 30.0.h;
}

@immutable
class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}