import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_subtask/bloc.dart';
import '../bloc/create_subtask/event.dart';
import '../bloc/create_subtask/state.dart';
import '../bloc/create_tasks_input_data/bloc.dart';
import '../bloc/create_tasks_input_data/event.dart';
import '../domain/models/task.dart';

Widget SubtaskBlockList(BuildContext context) {

  return BlocBuilder<CreateSubtask, SubtaskState>(
      builder: (context, state) {
      return ListView.builder(
          itemCount: state.subtasksList.length + 1,
          itemBuilder: (BuildContext context, int i) {
            return i == state.subtasksList.length ? AddBlockBtn(context) : SubtaskBlock(context);
          }
      );
    }
  );
}
Widget AddBlockBtn(BuildContext context) {
  final CreateSubtask createSubtask = context.read<CreateSubtask>();

  return  Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Center(
      child: ElevatedButton(
        onPressed: (){
          createSubtask.add(SubtaskAddBlockEvent());
        },
        child: const Text('Add subtask'),
      ),
    ),
  );
}

Widget SubtaskBlock(BuildContext context) {
  final CreateTaskInputData textBloc = context.read<CreateTaskInputData>();
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(46, 78, 160, 0.7372549019607844),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFF6EB0EA),
            hintText: 'Enter subtask name',
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
            hintText: 'Enter subtask description',
          ),
          onChanged: (String value){
            textBloc.add(AddDescriptionEvent(description: value));
          },
        ),
      ],
    ),
  );
}

