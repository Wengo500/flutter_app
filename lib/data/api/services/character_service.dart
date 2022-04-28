import 'package:first_project/data/api/model/api_character.dart';
import 'package:first_project/data/api/request/get_character_body.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CharacterService {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<ApiCharacter> getCharacter(GetCharacterBody body) async {
    try {
      var response = await http.get(Uri.parse(url + '?page=${body.page}&name=${body.name}'));
      var jsonResult = json.decode(response.body);
      return ApiCharacter.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
