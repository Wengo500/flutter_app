import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  final String name;
  final String description;
  final bool progress;
  final List subtask;

  Task({
    required this.name,
    required this.description,
    required this.progress,
    required this.subtask
});
  factory Task.fromJson(Map<dynamic, dynamic> json){
    return Task(
      name: json['name'],
      description: json['description'],
      progress: json['progress'],
      subtask: [],
    );
  }
  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    final newTask = Task.fromJson(snapshot.data() as Map<String, dynamic>);
    return newTask;
  }
}

