import 'package:first_project/domain/bloc/create_subtask/bloc.dart';
import 'package:first_project/domain/bloc/create_subtask/event.dart';
import 'package:first_project/domain/bloc/create_subtask/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget SubtaskBlockList(BuildContext context) {

  return BlocBuilder<CreateSubtask, SubtaskState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.blockList.length + 2,
          itemBuilder: (BuildContext context, int i) {
            return i == 0 ? const SizedBox(height: 290) :
            i == state.blockList.length + 1 ? AddBlockBtn(context) : SubtaskBlock(context, i);
          }
      );
    }
  );
}
Widget AddBlockBtn(BuildContext context) {
  final CreateSubtask createSubtask = context.read<CreateSubtask>();

  return  Padding(
    padding: const EdgeInsets.only(bottom: 60),
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

Widget SubtaskBlock(BuildContext context, int idx) {
  final CreateSubtask createSubtask = context.read<CreateSubtask>();
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(46, 78, 160, 1.0),
      borderRadius: BorderRadius.circular(10),
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
            createSubtask.add(SubtaskNameEvent(name: value, blockIndex: idx));
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
            createSubtask.add(SubtaskDescriptionEvent(description: value, blockIndex: idx));
          },
        ),
      ],
    ),
  );
}

