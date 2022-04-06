import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:first_project/data/models/character.dart';
import 'package:first_project/data/repository/character_repo.dart';

part 'bloc.freezed.dart';
// part 'bloc.g.dart';
part 'event.dart';
part 'state.dart';

@freezed
class CharacterBlock extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
  CharacterBlock({required this.characterRepo}) : super(const CharacterState.loading()){
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try {
        Character _characterLoaded = await characterRepo.getCharacter(event.page, event.name);
        emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      } catch (_) {
        emit(const CharacterState.error());
      }
    });
  }
}