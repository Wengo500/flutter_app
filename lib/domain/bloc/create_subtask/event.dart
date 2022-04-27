abstract class SubtaskEvent {
  @override
  List<Object> get props => [];
}

class SubtaskNameEvent extends SubtaskEvent {
  final int? blockIndex;
  final String? name;
  SubtaskNameEvent({required this.name, required this.blockIndex});
}
class SubtaskDescriptionEvent extends SubtaskEvent {
  final int blockIndex;
  final String? description;
  SubtaskDescriptionEvent({required this.description, required this.blockIndex});
}
class SubtaskAddBlockEvent extends SubtaskEvent {}