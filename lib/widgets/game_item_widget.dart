// lib/widgets/game_item_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygame/blocs/game/game_cubit.dart';
import 'package:mygame/models/game.dart';

class GameItemWidget extends StatelessWidget {
  final Game game;

  const GameItemWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(game.name),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<GameCubit>().removeGame(game.id);
        },
      ),
    );
  }
}
