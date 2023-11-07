import 'package:flutter/material.dart';

/// [TextThemeContext] - A custom extension on `BuildContext` to access
/// TextStyle easily with build context
extension TextThemeContext on BuildContext {
  TextTheme textTheme() => Theme.of(this).textTheme;

  TextStyle displayLarge(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.displayLarge!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle displayMedium(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.displayMedium!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle displaySmall(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.displaySmall!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle headlineMedium(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.headlineMedium!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle headlineSmall(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.headlineSmall!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle titleLarge(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.titleLarge!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle titleMedium(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.titleMedium!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle titleSmall(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.titleSmall!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle bodyLarge(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.bodyLarge!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle bodyMedium(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.bodyMedium!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle bodySmall(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.bodySmall!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
  TextStyle labelSmall(
      {Color? textColor, double? fontSize, FontWeight? fontWeight}) =>
      Theme.of(this).textTheme.labelSmall!.copyWith(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight);
}

extension ThemeContext on BuildContext {
  ThemeData theme() => Theme.of(this);
}
