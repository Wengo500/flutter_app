abstract class SubtaskEvent {
  @override
  List<Object> get props => [];
}

class SubtaskNameEvent extends SubtaskEvent {
  final String? name;
  SubtaskNameEvent({required this.name});
}
class SubtaskDescriptionEvent extends SubtaskEvent {
  final String? description;
  SubtaskDescriptionEvent({required this.description});
}
class SubtaskAddBlockEvent extends SubtaskEvent {}

class CreateTaskEvent extends SubtaskEvent {
  final Object? subtaskBlockData;
  CreateTaskEvent({required this.subtaskBlockData});
}