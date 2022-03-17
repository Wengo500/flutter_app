import 'package:first_project/domain/workout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
          title: const Text('First app'),
          leading: const Icon(Icons.list),),
        body: Container(
            child: WorkoutsList()
        ),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget{
  final workouts = <Workout> [
    Workout('test1', 'name1', "test desc", 'Beginner'),
    Workout('test2', 'name2', "test desc", 'Intermediate'),
    Workout('test3', 'name3', "test desc", 'Advanced'),
    Workout('test4', 'name4', "test desc", 'Advanced'),
    Workout('test5', 'name5', "test desc", 'Beginner'),
    Workout('test6', 'name5', "test desc", 'Beginner'),
    Workout('test7', 'name5', "test desc", 'Beginner'),
    Workout('test8', 'name5', "test desc", 'Beginner'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, i){
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(
                      37, 77, 159, 0.7568627450980392)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(Icons.today_outlined, color: Theme.of(context).colorScheme.secondary),
                      decoration: const BoxDecoration(
                        border: Border(right: BorderSide(width: 1, color: Colors.white24)) ,
                      ),
                    ),
                    title: Text(workouts[i].title,
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                    trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).colorScheme.secondary),
                    subtitle: subtitle(context, workouts[i]),
                  ),
                ),
              );
            }
        ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout){
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch(workout.level){
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.6;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      const SizedBox(width: 10,),
      Expanded(
          flex: 3,
          child: Text(workout.level, style: Theme.of(context).textTheme.subtitle2)
      )
    ],
  );
}