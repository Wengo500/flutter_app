import 'package:first_project/bloc/create_subtask/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CreateSubtask extends Bloc <SubtaskEvent, SubtaskState> {
  CreateSubtask() : super(NewSubtaskState(subtasksList: [], name: '', description: '', blockList: [])){
    on<SubtaskNameEvent>((event, emit) => emit(NewSubtaskState(
      name: event.name,
      description: state.description,
      subtasksList: [],
      blockList: state.blockList
    )));
    on<SubtaskDescriptionEvent>((event, emit) => emit(NewSubtaskState(
      name: state.name,
      description: event.description,
      subtasksList: [],
      blockList: state.blockList
    )));
    on<SubtaskAddBlockEvent>((event, emit) => emit(NewSubtaskState(
      name: state.name,
      description: state.description,
      subtasksList: [...state.subtasksList, state.subtasksList.length],
      blockList: []
    )));
    on<CreateTaskEvent>((event, emit) => emit(NewSubtaskState(
        name: state.name,
        description: state.description,
        subtasksList: state.subtasksList,
        blockList: []
    )));
  }
}