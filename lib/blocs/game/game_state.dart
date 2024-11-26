// lib/blocs/game/game_state.dart
import 'package:mygame/models/game.dart';

abstract class GameState {}

class GameInitial extends GameState {}

class GameLoaded extends GameState {
  final List<Game> games;

  GameLoaded(this.games);
}

class GameAdded extends GameState {
  final List<Game> games;

  GameAdded(this.games);
}

class GameRemoved extends GameState {
  final List<Game> games;

  GameRemoved(this.games);
}
