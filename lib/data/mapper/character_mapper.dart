import 'package:first_project/data/api/model/api_character.dart';
import 'package:first_project/domain/model/character.dart';

class CharacterMapper {
  static Character fromApi(ApiCharacter day) {
    final testInfo = Info(
      count: day.info.count.toInt(),
      pages: day.info.pages.toInt(),
      next: day.info.next,
      prev: day.info.prev,
    );
    final testResult = Result(
      id: day.results[0].id,
      name: day.results[1].name,
      status: day.results[2].status,
      species: day.results[3].species,
      gender: day.results[4].gender,
      image: day.results[5].image,
    );
    return Character(
      info: testInfo,
      results: [testResult],
    );
  }
}