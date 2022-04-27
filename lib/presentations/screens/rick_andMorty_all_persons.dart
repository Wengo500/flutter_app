import 'package:first_project/domain/bloc/rick_and_morty_bloc/bloc.dart';
import 'package:first_project/domain/model/character.dart';
import 'package:first_project/internal/dependencies/character_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllPersonsPage extends StatefulWidget {
  const AllPersonsPage({Key? key}) : super(key: key);
  @override
  _AllPersonsPageState createState() => _AllPersonsPageState();
}

class _AllPersonsPageState extends State<AllPersonsPage> {

  List<Result> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  final RefreshController refreshController = RefreshController();
  bool _isPagination = false;
  CharacterBlock? _characterState;
  @override
  void initState() {
    super.initState();
    _characterState = CharacterModule.homeState();
    if(_currentResults.isEmpty) {
      context.read<CharacterBlock>()
          .add(const CharacterEvent.fetch(page: 1, name: 'rick'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBlock>().state;
    print(_characterState?.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Persons'),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(

        ))
    );
  }
}