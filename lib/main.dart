import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/screens/lending.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget{
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    const appName = 'Custom Themes';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(66, 137, 250, 1.0),
        fontFamily: 'Georgia',
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        textTheme: const TextTheme(
            headline6: TextStyle(color: Colors.white ,fontSize: 36.0, fontStyle: FontStyle.italic),
            subtitle1: TextStyle(color: Colors.white ,fontSize: 25.0, fontStyle: FontStyle.normal),
            subtitle2: TextStyle(color: Colors.white ,fontSize: 20.0, fontStyle: FontStyle.italic),
        ),
      ),
      home: LandingPage(),
    );
  }
}
