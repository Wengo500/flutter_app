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
  factory Task.dataFromInputs(Map<String, dynamic> domain){
    return Task(
      name: domain['name'],
      description: domain['name'],
      progress: domain['name'],
      subtask: domain['name'],
    );
  }
}

