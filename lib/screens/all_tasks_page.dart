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
        title: const Center(
          child: Text('All model'),
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
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
                          71, 112, 195, 1.0),
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
      color: Color.fromRGBO( 71, 112, 195, 1.0),
      child: Icon(Icons.add, color: Colors.white, size: 100,)
      ),
  );
}