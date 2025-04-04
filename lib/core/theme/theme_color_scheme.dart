import 'package:flutter/material.dart';

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  // PRIMARY
  final Color? primary;
  final Color? primaryVariant1;
  final Color? primaryText;
  final Color? primarySurface1;
  final Color? primarySurface2;

  // BACKGROUND
  final Color? background;
  final Color? backgroundVariant;
  final Color? surface;
  final Color? surfaceVariant;
  final Color? disableVariant;

  // TEXT
  final Color? text;
  final Color? textDetail;
  final Color? textHint;
  final Color? textCaption;
  final Color? textWhite;

  const CustomColorScheme({
    // PRIMARY
    required this.primary,
    required this.primaryVariant1,
    required this.primaryText,
    required this.primarySurface1,
    required this.primarySurface2,
    // BACKGROUND
    required this.background,
    required this.backgroundVariant,
    required this.surface,
    required this.surfaceVariant,
    required this.disableVariant,
    // TEXT
    required this.text,
    required this.textDetail,
    required this.textHint,
    required this.textCaption,
    required this.textWhite,
  });

  @override
  CustomColorScheme copyWith({
    // PRIMARY
    Color? primary,
    Color? primaryVariant1,
    Color? primaryText,
    Color? primarySurface1,
    Color? primarySurface2,
    // BACKGROUND
    Color? background,
    Color? backgroundVariant,
    Color? surface,
    Color? surfaceVariant,
    Color? disableVariant,
    // TEXT
    Color? text,
    Color? textDetail,
    Color? textHint,
    Color? textCaption,
    Color? textWhite,
  }) {
    return CustomColorScheme(
      // PRIMARY
      primary: primary ?? this.primary,
      primaryVariant1: primaryVariant1 ?? this.primaryVariant1,
      primaryText: primaryText ?? this.primaryText,
      primarySurface1: primarySurface1 ?? this.primarySurface1,
      primarySurface2: primarySurface2 ?? this.primarySurface2,
      // BACKGROUND
      background: background ?? this.background,
      backgroundVariant: backgroundVariant ?? this.backgroundVariant,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      disableVariant: disableVariant ?? this.disableVariant,
      // TEXT
      text: text ?? this.text,
      textDetail: textDetail ?? this.textDetail,
      textHint: textHint ?? this.textHint,
      textCaption: textCaption ?? this.textCaption,
      textWhite: textWhite ?? this.textWhite,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColorScheme lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      // PRIMARY
      primary: Color.lerp(primary, other.primary, t),
      primaryVariant1: Color.lerp(primaryVariant1, other.primaryVariant1, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      primarySurface1: Color.lerp(primarySurface1, other.primarySurface1, t),
      primarySurface2: Color.lerp(primarySurface2, other.primarySurface2, t),
      // BACKGROUND
      background: Color.lerp(background, other.background, t),
      backgroundVariant: Color.lerp(backgroundVariant, other.backgroundVariant, t),
      surface: Color.lerp(surface, other.surface, t),
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t),
      disableVariant: Color.lerp(disableVariant, other.disableVariant, t),
      // TEXT
      text: Color.lerp(text, other.text, t),
      textDetail: Color.lerp(textDetail, other.textDetail, t),
      textHint: Color.lerp(textHint, other.textHint, t),
      textCaption: Color.lerp(textCaption, other.textCaption, t),
      textWhite: Color.lerp(textWhite, other.textWhite, t),
    );
  }
}
