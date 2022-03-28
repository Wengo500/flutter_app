import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_tasks_input_data/bloc.dart';
import '../bloc/create_tasks_input_data/event.dart';

Widget CreateTaskPageBanner(BuildContext context) {
  final CreateTaskInputData textBloc = context.read<CreateTaskInputData>();
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal :10),
    decoration: const BoxDecoration(
      color: Color.fromRGBO(9, 62, 196, 1.0),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
    ),
    child: Column(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFF6EB0EA),
            hintText: 'Enter task name',
            hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
          ),
          onChanged: (String value){
            textBloc.add(AddNameEvent(name: value));
          },
        ),
        const SizedBox(height: 20,),
        TextField(
          maxLines: 3,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFF6EB0EA),
            hintStyle: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300),
            border: OutlineInputBorder(),
            hintText: 'Enter task description',
          ),
          onChanged: (String value){
            textBloc.add(AddDescriptionEvent(description: value));
          },
        ),
      ],
    ),
  );
}

