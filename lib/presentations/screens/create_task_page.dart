import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/create_tasks_input_data/bloc.dart';
import '../../bloc/create_tasks_input_data/event.dart';
import '../../bloc/create_tasks_input_data/state.dart';
import '../widgets/create_task_page_banner.dart';
import '../widgets/subtask_block_list.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.deepPurple,
        title: const Text('Create task'),
      ),
      body: BlocBuilder<CreateTaskInputData, TextState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.8, -0.6),
                colors: [
                  Color.fromRGBO(3, 235, 255, 1),
                  Color.fromRGBO(82, 24, 152, 1.0)
                ],
                radius: 1.0,
              ),
            ),
            child: Stack(
              children: [
                SubtaskBlockList(context),
                CreateTaskPageBanner(context),
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
  final CreateTaskInputData createTask = context.read<CreateTaskInputData>();
  return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              createTask.add(CreateTaskEvent(subtaskList: []));
              Navigator.pop(context);
            }, child: const Text('Create task', style: TextStyle(fontSize: 30),)),
        )
    );
}