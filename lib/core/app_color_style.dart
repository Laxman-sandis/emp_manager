import 'package:emp_manager/core/theme/theme_color_scheme.dart';
import 'package:flutter/material.dart';

class AppColorStyle {
  // PRIMARY
  static primary(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.primary;
  }

  static primaryVariant1(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.primaryVariant1;
  }

  static primaryText(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.primaryText;
  }

  static primarySurface1(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.primarySurface1;
  }

  static primarySurface2(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.primarySurface2;
  }

  // BACKGROUND
  static background(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.background;
  }

  static backgroundVariant(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.backgroundVariant;
  }

  static surface(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.surface;
  }

  static surfaceVariant(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.surfaceVariant;
  }

  static disableVariant(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.disableVariant;
  }

  // TEXT
  static text(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.text;
  }

  static textDetail(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.textDetail;
  }

  static textHint(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.textHint;
  }

  static textCaption(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.textCaption;
  }

  static textWhite(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()?.textWhite;
  }
}
