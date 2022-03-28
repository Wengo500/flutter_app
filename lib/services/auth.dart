import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/domain/models/user.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  Future logOut() async {
    await _fAuth.signOut();
  }
}
