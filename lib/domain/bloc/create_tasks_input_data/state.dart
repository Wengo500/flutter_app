abstract class TextState {
  get description => null;
  get name => null;
  get subtasksList => null;
}

class TextAddedState extends TextState {
  final String? name;
  final String? description;
  final List? subtasksList;

  TextAddedState({required this.name, required this.description, required this.subtasksList });

  List<Object?> get props => [name, description];
}