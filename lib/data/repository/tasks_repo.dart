import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';

class TaskRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addTasks(Task data) async {
    // await _db.collection("model").doc(data.name).set(data.toMap());
  }

  Future<List<Task>> retrieveTasksData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("model").get();
    return snapshot.docs
        .map((docSnapshot) => Task.fromSnapshot(docSnapshot))
        .toList();
  }

  // Future<String> retrieveUserName(Task user) async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshot =
  //   await _db.collection("Users").doc(user.uid).get();
  //   return snapshot.data()!["displayName"];
  // }
}