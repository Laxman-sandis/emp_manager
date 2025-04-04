import 'package:emp_manager/core/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme_color_scheme.dart';

class ThemeConfig {
  ThemeConfig._privateConstructor();

  static final ThemeConfig instance = ThemeConfig._privateConstructor();

  factory ThemeConfig() {
    return instance;
  }

  /// [LIGHT THEME]
  final _lightTheme = ThemeData(
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    useMaterial3: false,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColorScheme(
        // PRIMARY
        primary: ThemeConstant.primary,
        primaryVariant1: ThemeConstant.primaryVariant1,
        primaryText: ThemeConstant.primaryText,
        primarySurface1: ThemeConstant.primarySurface1,
        primarySurface2: ThemeConstant.primarySurface2,
        // BACKGROUND
        background: ThemeConstant.background,
        backgroundVariant: ThemeConstant.backgroundVariant,
        surface: ThemeConstant.surface,
        surfaceVariant: ThemeConstant.surfaceVariant,
        disableVariant: ThemeConstant.disableVariant,
        // TEXT
        text: ThemeConstant.text,
        textDetail: ThemeConstant.textDetail,
        textHint: ThemeConstant.textHint,
        textCaption: ThemeConstant.textCaption,
        textWhite: ThemeConstant.textWhite,
      ),
    ],
  );

  /// [DARK THEME]
  final _darkTheme = ThemeData(
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    useMaterial3: false,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColorScheme(
        // PRIMARY
        primary: ThemeConstant.primary,
        primaryVariant1: ThemeConstant.primaryVariant1,
        primaryText: ThemeConstant.primaryText,
        primarySurface1: ThemeConstant.primarySurface1Dark,
        primarySurface2: ThemeConstant.primarySurface2Dark,
        // BACKGROUND
        background: ThemeConstant.backgroundDark,
        backgroundVariant: ThemeConstant.backgroundVariantDark,
        surface: ThemeConstant.surfaceDark,
        surfaceVariant: ThemeConstant.surfaceVariantDark,
        disableVariant: ThemeConstant.disableVariant,
        // TEXT
        text: ThemeConstant.textDark,
        textDetail: ThemeConstant.textDetailDark,
        textHint: ThemeConstant.textHintDark,
        textCaption: ThemeConstant.textCaption,
        textWhite: ThemeConstant.textWhite,
      ),
    ],
  );

  buildThemeData(bool? isDark) {
    return isDark == true ? _darkTheme : _lightTheme;
  }
}
