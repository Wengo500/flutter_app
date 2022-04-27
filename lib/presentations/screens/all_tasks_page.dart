import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../internal/generated/l10n.dart';
import 'create_task_page.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final localizationTextObj = S.of(context);
    return Scaffold(
      appBar: NewGradientAppBar(
        title:  Center(
          child: Text(localizationTextObj.title, style: const TextStyle(fontSize: 35),),
        ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(19, 18, 18, 1.0),
              Color.fromRGBO(17, 0, 29, 1.0),
          ]),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.6, 1.7),
            colors: [
              Color.fromRGBO(17, 0, 29, 1.0),
              Color.fromRGBO(19, 18, 18, 1.0)
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(35, 1, 60, 0.7254901960784313),
        ),
        child: const Icon(Icons.add, color: Colors.white70, size: 100,)
      ),
  );
}

Widget allTaskList (BuildContext context, snapshot) {
  return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.docs.length + 1,
      itemBuilder: (BuildContext context, int index) {
        final taskIndex = index - 1;
        Random random = Random();
        int randomNumber = random.nextInt(100);

        int r = 80 * randomNumber;
        int g = 20 * randomNumber;
        int b = 30 * randomNumber;

        return index == 0 ? addNewTaskButton(context) :
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(35, 1, 60, 0.7254901960784313),
          ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.task_alt_rounded, color: Color.fromRGBO(
                          r, g, b, 1.0), size: 40),
                      const Icon(Icons.menu, color: Colors.white54, size: 35,)
                    ],
                  ),
                  Text(
                    snapshot.data!.docs[taskIndex].get('name'),
                    style: const TextStyle(color: Colors.white)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 50,
                        size: 5,
                        padding: 0,
                         selectedColor: Colors.yellow,
                         unselectedColor: Colors.cyan,
                        roundedEdges: Radius.circular(10),
                        selectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.deepPurple, Colors.lightBlueAccent],
                        ),
                        unselectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white38, Colors.white38],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(r, g, b, 1.0),
                        ),
                        child: const Text('20/40',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(35, 1, 60, 0.7254901960784313)),
                        )
                      ),
                    ],
                  ),
                       ],
              ),
            ),
          ),
        );
      }
  );
}