import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/bloc/create_tasks_input_data/bloc.dart';
import 'package:first_project/screens/lending.dart';
import 'package:first_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/bloc.dart';
import 'bloc/create_subtask/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirstApp());
}


class FirstApp extends StatelessWidget{
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    const appName = 'First App';
    return  MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context)
          ),
        ),
        BlocProvider<CreateTaskInputData>(
          create: (BuildContext context) => CreateTaskInputData(),
        ),
        BlocProvider<CreateSubtask>(
          create: (BuildContext context) => CreateSubtask(),
        ),
      ], child: MaterialApp(
          title: appName,
          theme: ThemeData(
            // brightness: Brightness.light,
            primaryColor: const Color.fromRGBO(66, 137, 250, 1.0),
            fontFamily: 'Georgia',
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            textTheme: const TextTheme(
              headline6: TextStyle(color: Colors.white ,fontSize: 36.0, fontStyle: FontStyle.italic),
              subtitle1: TextStyle(color: Colors.white ,fontSize: 25.0, fontStyle: FontStyle.normal),
              subtitle2: TextStyle(color: Colors.white ,fontSize: 20.0, fontStyle: FontStyle.italic),
            ),
          ),
        home: LandingPage()
       ),
    );
  }
}
