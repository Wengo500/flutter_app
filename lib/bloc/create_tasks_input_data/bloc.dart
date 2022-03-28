import 'package:first_project/bloc/create_tasks_input_data/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CreateTaskInputData extends Bloc <TextEvent, TextState> {
  CreateTaskInputData() : super(TextAddedState(name: '', description: '')){
    on<AddNameEvent>((event, emit) => emit(TextAddedState(
        name: event.name,
        description: state.description
    )));
    on<AddDescriptionEvent>((event, emit) => emit(TextAddedState(
        name: state.name,
        description: event.description
    )));
  }
}