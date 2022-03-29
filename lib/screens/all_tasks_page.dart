import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'create_task_page.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff652494),
        title: const Center(
          child: Text('All tasks'),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            center: Alignment(-1.1, 1),
            colors: [
              Color.fromRGBO(77, 122, 231, 1.0),
              Color.fromRGBO(241, 0, 0, 1.0),
              Color.fromRGBO(60, 0, 191, 1.0),
            ],
              stops: <double>[0.6, 0, 1]
          ),
        ),
        child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('model').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  'Nothing yet',
                  style: TextStyle(
                      fontSize: 40, color: Colors.white
                  ),
                )
              );
            }
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
                          139, 147, 207, 0.050980392156862744),
                      child: Center(
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
                  );
                }
            );
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
          CupertinoPageRoute(builder: (context) => CreateTaskPage())
      );
    },
    child: const Card(
      color: Color.fromRGBO(139, 147, 207, 0.050980392156862744),
      child: Icon(Icons.add, color: Colors.white, size: 100,)
      ),
  );
}