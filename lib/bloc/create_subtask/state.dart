abstract class SubtaskState {
  get name => null;
  get description => null;
  get subtasksList => null;
  get blockList => null;
}

class NewSubtaskState extends SubtaskState {
  final String? name;
  final String? description;
  final List? subtasksList;
  final List? blockList;

  NewSubtaskState({required this.subtasksList, required this.name, required this.description, required this.blockList});

  List<Object?> get props => [subtasksList, name, description, blockList];
}