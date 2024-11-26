// lib/blocs/game/game_cubit.dart
import 'package:bloc/bloc.dart';
import 'game_state.dart';
import 'package:mygame/models/game.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  final List<Game> _games = [];

  List<Game> get games => _games;

  void addGame(String gameName) {
    _games.add(Game(
      name: gameName,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    ));
    emit(GameAdded(_games));
  }

  void removeGame(String id) {
    _games.removeWhere((game) => game.id == id);
    emit(GameRemoved(_games));
  }
}
