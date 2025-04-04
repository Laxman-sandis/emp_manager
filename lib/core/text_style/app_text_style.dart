import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType { maximum, xHigh, high, medium, low, minimum, unknown }

enum FontType {
  heading,
  subHeading,
  title,
  subTitle,
  detail,
  caption,
  small,
  extraSmall,
  extraBold
}

class FontsHelper {
  static const String robotoRegular = 'RobotoRegular';
  static const String robotoMedium = 'RobotoMedium';
  static const String robotoBold = 'RobotoBold';
  static const String robotoLight = 'RobotoLight';
}

class AppTextStyle {
  /// ******  ExtraBold  ******
  static extraBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.extraBold);
    return Theme.of(context)
        .textTheme
        .displayLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Headline  ******
  static headlineLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.heading);
    return Theme.of(context)
        .textTheme
        .displayLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static headlineRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.heading);
    return Theme.of(context)
        .textTheme
        .displayLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static displayMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.heading);
    return Theme.of(context)
        .textTheme
        .displayLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static headlineBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.heading);
    return Theme.of(context)
        .textTheme
        .displayLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Sub Headline  ******
  static subHeadlineLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subHeading);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static subHeadlineRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subHeading);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static subHeadlineMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subHeading);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static subHeadlineBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subHeading);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Title  ******
  static titleLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.title);
    return Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static titleRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.title);
    return Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static titleMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.title);
    return Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static titleBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.title);
    return Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Sub Title  ******
  static subTitleLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subTitle);
    return Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static subTitleRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subTitle);
    return Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static subTitleMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subTitle);
    return Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static subTitleBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.subTitle);
    return Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Details  ******
  static detailsLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.detail);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static detailsRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.detail);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static detailsMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.detail);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static detailsBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.detail);
    return Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Caption  ******
  static captionLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.caption);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static captionRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.caption);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static captionMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.caption);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static captionBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.caption);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Small  ******
  static smallLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.small);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static smallRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.small);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static smallMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.small);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static smallBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.small);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// ******  Extra Small  ******
  static extraSmallLight(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.extraSmall);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoLight, fontSize: fontSize);
  }

  static extraSmallRegular(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.extraSmall);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoRegular, fontSize: fontSize);
  }

  static extraSmallMedium(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.extraSmall);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoMedium, fontSize: fontSize);
  }

  static extraSmallBold(BuildContext context, Color color) {
    var fontSize = _getFontSize(FontType.extraSmall);
    return Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(color: color, fontFamily: FontsHelper.robotoBold, fontSize: fontSize);
  }

  /// Scale text font size as per device ratio
  static ScreenType getScreenRatio(BuildContext context) {
    double dprValue = _getDevicePixelRatio(context);
    printLog("Device DPR value:: $dprValue");

    if (dprValue >= 0 && dprValue < 1) {
      printLog("Device Size:: ${ScreenType.minimum}");
      return ScreenType.minimum;
    } else if (dprValue >= 1 && dprValue < 1.5) {
      printLog("Device Size:: ${ScreenType.low}");
      return ScreenType.low;
    } else if (dprValue >= 1.5 && dprValue < 2) {
      printLog("Device Size:: ${ScreenType.medium}");
      return ScreenType.medium;
    } else if (dprValue >= 2 && dprValue < 3) {
      printLog("Device Size:: ${ScreenType.high}");
      return ScreenType.high;
    } else if (dprValue >= 3 && dprValue < 4) {
      printLog("Device Size:: ${ScreenType.xHigh}");
      return ScreenType.xHigh;
    } else if (dprValue >= 4) {
      printLog("Device Size:: ${ScreenType.maximum}");
      return ScreenType.maximum;
    } else {
      printLog("Device Size:: ${ScreenType.unknown}");
      return ScreenType.unknown;
    }
  }

  static double _getFontSize(FontType type) {
    //if (AppTextStyleConfigController.shared.deviceScreenType == ScreenType.maximum) {
    switch (type) {
      case FontType.heading:
        return 26;
      case FontType.subHeading:
        return 22;
      case FontType.title:
        return 18;
      case FontType.subTitle:
        return 16;
      case FontType.detail:
        return 14;
      case FontType.caption:
        return 12;
      case FontType.small:
        return 10;
      case FontType.extraSmall:
        return 8;
      case FontType.extraBold:
        return 30;
    }
  }

  static double _getDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }
}

void printLog(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
