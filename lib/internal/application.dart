import 'package:first_project/data/repository/auth.dart';
import 'package:first_project/data/repository/tasks_repo.dart';
import 'package:first_project/domain/bloc/auth/bloc.dart';
import 'package:first_project/domain/bloc/create_subtask/bloc.dart';
import 'package:first_project/domain/bloc/create_tasks_input_data/bloc.dart';
import 'package:first_project/domain/bloc/rick_and_morty_bloc/bloc.dart';
import 'package:first_project/internal/dependencies/repository_module.dart';
import 'package:first_project/internal/generated/l10n.dart';
import 'package:first_project/presentations/screens/lending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FirstApp extends StatelessWidget{
  FirstApp({Key? key}) : super(key: key);
  final repository = RepositoryModule.characterRepo();
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
          create: (BuildContext context) => CreateTaskInputData(TaskRepo()),
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