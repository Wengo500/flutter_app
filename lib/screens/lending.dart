import 'package:flutter/material.dart';
import 'package:first_project/screens/auth.dart';
import 'package:first_project/screens/home.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}