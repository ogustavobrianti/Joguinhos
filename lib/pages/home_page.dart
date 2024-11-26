// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygame/blocs/game/game_cubit.dart';
import 'package:mygame/blocs/game/game_state.dart';
import 'package:mygame/pages/add_game_page.dart';
import 'package:mygame/widgets/game_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Desejos de Jogos"),
      ),
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          // Verificando o tipo de estado para acessar games
          if (state is GameInitial) {
            return const Center(child: Text('Nenhum jogo na lista'));
          } else if (state is GameLoaded) {
            // Quando o estado é GameLoaded, podemos acessar state.games
            return _buildGameList(state.games);
          } else if (state is GameAdded) {
            // Quando um jogo for adicionado
            return _buildGameList(state.games);
          } else if (state is GameRemoved) {
            // Quando um jogo for removido
            return _buildGameList(state.games);
          }

          // Caso o estado não seja reconhecido, exibe o carregamento
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
           MaterialPageRoute(builder: (context) => AddGamePage())

          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Método para construir a lista de jogos
  Widget _buildGameList(List games) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return GameItemWidget(game: games[index]);
      },
    );
  }
}

