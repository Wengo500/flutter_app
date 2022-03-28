import 'package:flutter/material.dart';
import 'package:first_project/screens/auth.dart';
import 'package:first_project/screens/home.dart';

import 'all_tasks_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;
    return isLoggedIn ?
    PageView(
      children: const <Widget>[
        HomePage(),
        AllTasksPage()
      ],
    ) : AuthorizationPage();
  }
}