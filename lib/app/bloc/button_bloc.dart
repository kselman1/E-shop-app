// button_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  List<String> clickedCategories = [];

  ButtonBloc() : super(ButtonInitialState());

  Stream<ButtonState> mapEventToState(ButtonEvent event) async* {
    if (event is AddCategoryEvent) {
      clickedCategories.add(event.category);
    } else if (event is RemoveCategoryEvent) {
      clickedCategories.remove(event.category);
    }

    yield ButtonLoadedState(List<String>.from(clickedCategories));
  }
}
