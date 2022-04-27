

import 'package:first_project/domain/bloc/rick_and_morty_bloc/bloc.dart';
import 'package:first_project/internal/dependencies/repository_module.dart';

class CharacterModule {
  static CharacterBlock homeState() {
    return CharacterBlock(
        characterRepo: RepositoryModule.characterRepo(),
    );
  }
}