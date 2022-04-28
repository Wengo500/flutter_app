import 'package:first_project/data/api/request/get_character_body.dart';
import 'package:first_project/data/api/services/character_service.dart';
import 'package:first_project/data/mapper/character_mapper.dart';
import 'package:first_project/domain/model/character.dart';
import 'package:meta/meta.dart';

class ApiUtil {
  final CharacterService _characterService;
  ApiUtil(this._characterService);

  Future<Character> getCharacter({
    @required int? page,
    @required String? name,
  }) async {
    final body = GetCharacterBody(page: page, name: name);
    final result = await _characterService.getCharacter(body);
    return CharacterMapper.fromApi(result);
  }
}