import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/data/repository/tasks_repo.dart';
import 'package:first_project/domain/bloc/create_tasks_input_data/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CreateTaskInputData extends Bloc <TextEvent, TextState> {
  final TaskRepo _taskRepo;
  CreateTaskInputData(this._taskRepo) :
        super(TextAddedState(name: '', description: '', subtasksList: [])){

    void addDataToFirebase() => {
      FirebaseFirestore.instance.collection('model').add({
        'name': state.name,
        'description': state.description,
        'progress': 0.33,
        'subtasks': [
          {'name': 'sub name', 'description': 'desk', 'blockIndex': 1}
            ],
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

