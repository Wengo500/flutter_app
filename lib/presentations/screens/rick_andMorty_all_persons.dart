import 'package:flutter/material.dart';

class AllPersonsPage extends StatelessWidget {
  const AllPersonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: const Center(child: Text('All persons'))),
      body: Container(

      ),
    );
  }
}
