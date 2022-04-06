import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/character.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, required this.result}) : super(key: key);

  final Results result;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        result.name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
