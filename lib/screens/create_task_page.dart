import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_subtask/bloc.dart';
import '../bloc/create_subtask/event.dart';
import '../bloc/create_tasks_input_data/bloc.dart';
import '../bloc/create_tasks_input_data/state.dart';
import '../widgets/create_task_page_banner.dart';
import '../widgets/subtask_block_list.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create task'),
      ),
      body: BlocBuilder<CreateTaskInputData, TextState>(
        builder: (context, state) {
          return Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                CreateTaskPageBanner(context),
                Expanded(child: SubtaskBlockList(context)),
                CreateTaskButton(context, state)
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget CreateTaskButton(BuildContext context, blockState) {
  final CreateSubtask createSubtask = context.read<CreateSubtask>();

  return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              createSubtask.add(CreateTaskEvent(subtaskBlockData: {'a': 'a'}));
              FirebaseFirestore.instance.collection('model').add({
                'name': blockState.name,
                'description': blockState.description,
                'progress': 0.33,
                'subtasks': [
                  {
                    'name': 'Task 1',
                    'description': 'Task 1 description',
                    'expiredDate': '04.03.2022',
                    'status': 'completed'
                  },
                  {
                    'name': 'Task 2',
                    'description': 'Task 2 description',
                    'expiredDate': '06.03.2022',
                    'status': 'overdue'
                  },
                  {
                    'name': 'Task 3',
                    'description': 'Task 3 description',
                    'expiredDate': '08.03.2022',
                    'status': 'expected'
                  }
                ],
              });
          }, child: const Text('Create task', style: TextStyle(fontSize: 30),)),
        )
    );
}