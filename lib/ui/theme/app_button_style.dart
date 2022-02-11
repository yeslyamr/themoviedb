import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final linkButton = ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
    visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity),
  );

  static final footerLinkButtonStyle = ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity));
}
