import 'package:first_project/data/api/services/character_service.dart';
import 'package:first_project/data/api/upi_util.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    return _apiUtil ?? ApiUtil(CharacterService());
  }
}