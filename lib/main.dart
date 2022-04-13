import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/bloc/create_tasks_input_data/bloc.dart';
import 'package:first_project/presentations/screens/lending.dart';
import 'package:first_project/data/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bloc/auth/bloc.dart';
import 'bloc/create_subtask/bloc.dart';
import 'bloc/rick_and_morty_bloc/bloc.dart';
import 'data/repository/character_repo.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirstApp());
}
class FirstApp extends StatelessWidget{
   FirstApp({Key? key}) : super(key: key);
  final repository = CharacterRepo();
  @override
  Widget build(BuildContext context){
    const appName = 'First App';
    return  MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
        ),
        BlocProvider<CharacterBlock>(
          create: (BuildContext context) => CharacterBlock(characterRepo: repository),
        ),
        BlocProvider<CreateTaskInputData>(
          create: (BuildContext context) => CreateTaskInputData(),
        ),
        BlocProvider<CreateSubtask>(
          create: (BuildContext context) => CreateSubtask(),
        ),
      ], child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
          title: appName,
          theme: ThemeData(
            // brightness: Brightness.light,
            primaryColor: const Color.fromRGBO(26, 26, 31, 1.0),
            fontFamily: 'Georgia',
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            textTheme: const TextTheme(
              headline6: TextStyle(color: Colors.white ,fontSize: 36.0, fontStyle: FontStyle.italic),
              subtitle1: TextStyle(color: Colors.white ,fontSize: 25.0, fontStyle: FontStyle.normal),
              subtitle2: TextStyle(color: Colors.white ,fontSize: 20.0, fontStyle: FontStyle.italic),
            ),
          ),
        home: const LandingPage()
       ),
    );
  }
}
