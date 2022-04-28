import 'package:first_project/domain/bloc/rick_and_morty_bloc/bloc.dart';
import 'package:first_project/domain/model/character.dart';
import 'package:first_project/internal/dependencies/character_module.dart';
import 'package:first_project/presentations/widgets/rick_and_morty_custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllPersonsPage extends StatefulWidget {
  const AllPersonsPage({Key? key}) : super(key: key);
  @override
  _AllPersonsPageState createState() => _AllPersonsPageState();
}

class _AllPersonsPageState extends State<AllPersonsPage> {

  Character? _currentCharacter;
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
          .add(const CharacterEvent.fetch(page: 1, name: ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBlock>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persons'),
      ),
      body: Container(
          color: Colors.black87,
          child: SizedBox.expand(
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(86, 86, 86, .8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    hintText: 'Search name',
                    hintStyle: const TextStyle(color: Colors.white)
                  ),
                  onChanged: (value) {
                    _currentPage = 1;
                    _currentResults = [];
                    _currentSearchStr = value;

                    context.read<CharacterBlock>()
                        .add(CharacterEventFetch(name: value, page: _currentPage));
                  },
                ),
                state.when(
                  loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 3)),
                  loaded: (characterLoaded) {
                    _currentCharacter = characterLoaded;
                    _currentResults = _currentCharacter?.results as List<Result>;
                    return _currentResults.isNotEmpty
                        ? Text('${_currentResults.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 30))
                        : const SizedBox();
                  },
                  error: () => const Text('some error')
        ),
              ],
            ),
          )
      )
    );
  }
}