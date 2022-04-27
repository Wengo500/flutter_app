import 'package:first_project/domain/bloc/create_subtask/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class CreateSubtask extends Bloc <SubtaskEvent, SubtaskState> {
  CreateSubtask() : super(NewSubtaskState(
      blockIndex: null,
      name: '',
      description: '',
      blockList: [],
      subtasksList: [])){
    on<SubtaskNameEvent>((event, emit) => emit(NewSubtaskState(
      blockIndex: event.blockIndex,
      name: event.name,
      description: state.description,
      blockList: state.blockList,
      subtasksList: [
        ...state.blockList,
        if(state.blockIndex == event.blockIndex){'name': event.name, 'description': state.description}
      ],
    )));
    on<SubtaskDescriptionEvent>((event, emit) => emit(NewSubtaskState(
      blockIndex: event.blockIndex,
      name: state.name,
      description: event.description,
      blockList: state.blockList,
      subtasksList: [
        ...state.blockList,
        if(state.blockIndex == event.blockIndex){'name': state.name, 'description': event.description}
      ],
    )));
    on<SubtaskAddBlockEvent>((event, emit) => emit(NewSubtaskState(
      blockIndex: state.blockIndex,
      name: state.name,
      description: state.description,
      blockList: [...state.blockList, state.blockList.length],
      subtasksList: state.subtasksList,
    )));
  }
}