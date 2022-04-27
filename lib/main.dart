import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/internal/application.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirstApp());
}

