// color_state.dart

import 'dart:ui';
import 'package:flutter/material.dart';

@immutable
class ColorState {
  final Color color;
  final List<String> selectedElements;

  ColorState(this.color, this.selectedElements);

  // A factory constructor for the initial state
  factory ColorState.initial(Color initialColor) {
    return ColorState(initialColor, []);
  }
}
