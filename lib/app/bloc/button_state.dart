// button_state.dart

part of 'button_bloc.dart';

@immutable
abstract class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonLoadedState extends ButtonState {
  final List<String> clickedCategories;

  ButtonLoadedState(this.clickedCategories);
}
