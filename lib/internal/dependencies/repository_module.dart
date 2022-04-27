import 'package:first_project/data/repository/character_data_repo.dart';
import 'package:first_project/domain/repository/character_repo.dart';
import 'package:first_project/internal/dependencies/api_module.dart';

class RepositoryModule {
  static CharacterRepository? _characterRepo;
  static CharacterRepository characterRepo() {
    return _characterRepo = _characterRepo
        ?? CharacterDataRepository(ApiModule.apiUtil());
  }
}