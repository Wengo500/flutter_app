import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('model').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (!snapshot.hasData) return const Text('hasData is false');
        final iterableList = snapshot.data!.docs.isEmpty == false ?
        snapshot.data!.docs[0].get('subtasks') : [];
        return subtaskDraggableList(context, iterableList);
      }
    );
  }
}

Widget subtaskDraggableList (BuildContext context, List iterableList) {
  return DraggableScrollableSheet(
      initialChildSize: .6,
      minChildSize: .6,
      maxChildSize: .91,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(45, 44, 60, 1.0),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Items',
                    style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  ),
              )
              ),
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: iterableList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(
                                53, 54, 85, 1)
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                              leading: Container(
                                padding: const EdgeInsets.only(right: 12),
                                child: Icon(Icons.today_outlined,
                                    color: Theme.of(context).colorScheme.secondary),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: Colors.white24
                                      )
                                  ),
                                ),
                              ),
                              title: Text(
                                iterableList[i]['name'],
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Theme.of(context).colorScheme.secondary),
                              subtitle: Text(iterableList[i]['description'],
                                  style: Theme.of(context).textTheme.subtitle2
                              )
                          ),
                        ),
                    );
                  }),
              ),
            ],
          ),
        );
      });
}