abstract class TextEvent {
  @override
  List<Object> get props => [];
}

class AddNameEvent extends TextEvent {
  final String? name;
  AddNameEvent({required this.name});
}
class AddDescriptionEvent extends TextEvent {
  final String? description;
  AddDescriptionEvent({required this.description});
}
class CreateTaskEvent extends TextEvent {
  final List? subtaskList;
  CreateTaskEvent({required this.subtaskList});
}
class DatabaseFetched extends TextEvent {
  final dynamic data;
  DatabaseFetched({required this.data});
}