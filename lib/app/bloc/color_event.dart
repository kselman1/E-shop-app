// color_event.dart

part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class ChangeColorEvent extends ColorEvent {
  final Color firstColor;
  final Color secondColor;
  final String elementName;

  ChangeColorEvent({
    required this.firstColor,
    required this.secondColor,
    required this.elementName,
  });
}
