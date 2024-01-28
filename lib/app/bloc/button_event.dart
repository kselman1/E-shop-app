// button_event.dart

part of 'button_bloc.dart';

@immutable
abstract class ButtonEvent {}

class AddCategoryEvent extends ButtonEvent {
  final String category;

  AddCategoryEvent(this.category);
}

class RemoveCategoryEvent extends ButtonEvent {
  final String category;

  RemoveCategoryEvent(this.category);
}
