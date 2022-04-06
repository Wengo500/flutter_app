import 'package:flutter/material.dart';

import '../widgets/main_page_banner.dart';
import '../widgets/task_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: const [
            MainPageBanner(),
            TasksList(),
          ],
        ),
      ),
    );
  }
}
