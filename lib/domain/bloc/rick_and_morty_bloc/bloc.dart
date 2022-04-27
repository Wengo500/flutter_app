import 'package:first_project/domain/model/character.dart';
import 'package:first_project/domain/repository/character_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.freezed.dart';
// part 'bloc.g.dart';
part 'event.dart';
part 'state.dart';

class CharacterBlock extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository characterRepo;
  // Future<Character> getCharacter({
  //   @required int? page,
  //   @required String? name,
  // }) async {
  //   return (page != null && name != null)
  //       ? await characterRepo.getCharacter(page: page, name: name)
  //       : Character();
  // }

  CharacterBlock({required this.characterRepo}) : super(const CharacterState.loading()){
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try {
        Character _characterLoaded = await characterRepo.getCharacter(page: event.page, name: event.name);
        emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      } catch (_) {
        print('eeeeeeeeeeeeror');
        emit(const CharacterState.error());
      }
    });
  }
}