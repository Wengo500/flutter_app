import 'package:flutter/material.dart';

class MainPageBanner extends StatelessWidget {
  const MainPageBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterWidth = MediaQuery.of(context).size.width * .4;
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 20),
          child: Center(
            child: Text(
              'Task name',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            taskTimeFrame(context, 'Start date', '2022.03.01'),
            Container(

                width: counterWidth,
                height: counterWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 253, 253, 0.6627450980392157),
                    borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(2, 33, 95, .6),
                      offset: Offset(4.0, 4.0),
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(203, 217, 246, .8),
                      offset: Offset(-4.0, -4.0),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '220',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.indigo,
                    ),
                  ),
                )),
            taskTimeFrame(context, 'Finish date', '2022.04.30'),
          ],
        )
      ],
    );
  }
}

Widget taskTimeFrame(BuildContext context, String name, String date) {
  return Column(
    children: [
      Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      Text(
        date,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    ],
  );
}
