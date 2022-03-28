abstract class TextState {
  get description => null;
  get name => null;
}

class TextAddedState extends TextState {
  final String? name;
  final String? description;

  TextAddedState({required this.name, required this.description });

  List<Object?> get props => [name, description];
}