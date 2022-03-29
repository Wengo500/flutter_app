import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/bloc/create_tasks_input_data/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CreateTaskInputData extends Bloc <TextEvent, TextState> {
  CreateTaskInputData() : super(TextAddedState(name: '', description: '', subtasksList: [])){
    void addDataToFirebase() => {
      FirebaseFirestore.instance.collection('model').add({
        'name': state.name,
        'description': state.description,
        'progress': 0.33,
        'subtasks': state.subtasksList,
      }),
    };
    on<AddNameEvent>((event, emit) => emit(TextAddedState(
        name: event.name,
        description: state.description,
        subtasksList: state.subtasksList,
    )));
    on<AddDescriptionEvent>((event, emit) => emit(TextAddedState(
        name: state.name,
        description: event.description,
        subtasksList: state.subtasksList,
    )));
    on<CreateTaskEvent>((event, emit) {
      addDataToFirebase();
      emit(TextAddedState(
          name: state.name,
          description: state.description,
          subtasksList: event.subtaskList));
      }
    );
  }
}

