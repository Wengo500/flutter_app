import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'create_task_page.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text('All tasks', style: TextStyle(fontSize: 35),),
        ),
          gradient: const LinearGradient(colors: [
            Colors.blue,
            Colors.deepPurple,
            Color.fromRGBO(17, 0, 29, 1.0)
          ]),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.6, 1.7),
            colors: [
              Color.fromRGBO(55, 122, 174, 1.0),
              Color.fromRGBO(17, 0, 29, 1.0),
            ],
              stops: <double>[0.17, 0.8,]
          ),
        ),
        child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('model').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) return const Text('Nothing yet');
            return allTaskList(context, snapshot);
          }
        ),
      ),
    );
  }
}

Widget addNewTaskButton (BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => const CreateTaskPage())
      );
    },
    child: const Card(
      color: Color.fromRGBO(139, 147, 207, 0.050980392156862744),
      child: Icon(Icons.add, color: Colors.white, size: 100,)
      ),
  );
}

Widget allTaskList (BuildContext context, snapshot) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
      ),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.docs.length + 1,
      itemBuilder: (BuildContext context, int index) {
        final taskIndex = index - 1;
        return index == 0 ? addNewTaskButton(context) :
        Card(
          color: const Color.fromRGBO(
              255, 255, 255, 0.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
                  child: Container(
                    color: const Color.fromRGBO(
                        101, 9, 134, 0.30196078431372547),
                  ),
                ),
              ),
              Center(
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      snapshot.data!.docs[taskIndex].get('name'),
                      style: const TextStyle(
                          color: Colors.white),
                    ),
                  ),
                  subtitle: LinearProgressIndicator(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    value: 0.44,
                    valueColor: const AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
              ),
            ],
          ),
        );
      }
  );
}