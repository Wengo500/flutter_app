import 'package:firebase_auth/firebase_auth.dart';

class UserId {
  late String id;
  UserId.fromFirebase(User user){
    id = user.uid;
  }
}