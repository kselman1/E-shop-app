// color_bloc.dart

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/app/bloc/color_state.dart';

part 'color_event.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final Color firstColor;
  final Color secondColor;

  ColorBloc({required this.firstColor, required this.secondColor})
      : super(ColorState.initial(firstColor)) {
    on<ChangeColorEvent>((event, emit) {
      Color newColor = state.color == firstColor ? secondColor : firstColor;

      
      List<String> selectedElements = [event.elementName];

      emit(ColorState(newColor, selectedElements));
    });
  }

  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    
  }
}
