abstract class SubtaskState {
  get blockIndex => null;
  get name => null;
  get description => null;
  get blockList => null;
  get subtasksList => null;
}

class NewSubtaskState extends SubtaskState {
  final int? blockIndex;
  final String? name;
  final String? description;
  final List? blockList;
  final List? subtasksList;

  NewSubtaskState({
    required this.blockIndex,
    required this.name,
    required this.description,
    required this.blockList,
    required this.subtasksList
  });

  List<Object?> get props => [blockIndex, name, description, blockList, subtasksList];
}