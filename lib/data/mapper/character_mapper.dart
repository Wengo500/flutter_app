import 'package:first_project/data/api/model/api_character.dart';
import 'package:first_project/domain/model/character.dart';

class CharacterMapper {
  static Character fromApi(ApiCharacter day) {
    final testInfo = Info(
      count: day.apiInfo.count.toInt(),
      pages: day.apiInfo.pages.toInt(),
      next: day.apiInfo.next,
      prev: day.apiInfo.prev,
    );
    final testResult = Result(
      id: day.apiResults[0].id,
      name: day.apiResults[1].name,
      status: day.apiResults[2].status,
      species: day.apiResults[3].species,
      gender: day.apiResults[4].gender,
      image: day.apiResults[5].image,
    );

    return Character(
      info: testInfo,
      results: [testResult],
    );
  }
}