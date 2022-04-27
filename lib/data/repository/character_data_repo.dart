import 'package:first_project/data/api/upi_util.dart';
import 'package:first_project/domain/model/character.dart';
import 'package:first_project/domain/repository/character_repo.dart';

class CharacterDataRepository extends CharacterRepository {
  final ApiUtil _apiUtil;

  CharacterDataRepository(this._apiUtil);

  @override
  Future<Character> getCharacter({int? page, String? name}) {
    return _apiUtil.getCharacter(page: page, name: name);
  }
}