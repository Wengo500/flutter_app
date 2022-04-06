import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/rick_and_morty_bloc/bloc.dart';
import '../../data/models/character.dart';
import '../widgets/rick_and_morty_custom_list_tile.dart';

class AllPersonsPage extends StatefulWidget {
  const AllPersonsPage({Key? key}) : super(key: key);
  @override
  _AllPersonsPageState createState() => _AllPersonsPageState();
}

class _AllPersonsPageState extends State<AllPersonsPage> {
  late Character _currentCharacter;
  List<Results> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  @override
  void initState() {
    if(_currentResults.isEmpty){
      context
          .read<CharacterBlock>()
          .add(const CharacterEvent.fetch(name: '', page: 1));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context
        .watch<CharacterBlock>()
        .state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Persons'),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(86, 86, 86, 0.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
                context
                    .read<CharacterBlock>()
                    .add(CharacterEvent.fetch(name: value, page: _currentPage));
              },
            ),
            Expanded(
              child: state.when(
                  loading: () {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(strokeWidth: 2,),
                          SizedBox(width: 10),
                          Text('Loading...'),
                        ],
                      ),
                    );
                  },
                  loaded: (characterLoaded) {
                    _currentCharacter = characterLoaded;
                    _currentResults = _currentCharacter.results;
                    return _currentResults.isNotEmpty
                      ? _customListView(_currentResults)
                      : const SizedBox();
                  },
                  error: () => const Text('Error')
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _customListView(List<Results> currentResults) {
    return ListView.separated(
        separatorBuilder: (_, index) => const SizedBox(height: 5,),
        itemCount: currentResults.length,
        itemBuilder: (context, index) {
          final result = currentResults[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
            child: CustomListTile(result: result,),
          );
        },
    );
  }
}