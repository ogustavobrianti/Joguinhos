// lib/pages/add_game_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygame/blocs/game/game_cubit.dart';

class AddGamePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Jogo à Lista de Desejos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Nome do Jogo"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final gameName = _controller.text.trim();
                if (gameName.isNotEmpty) {
                  context.read<GameCubit>().addGame(gameName);
                  Navigator.pop(context);
                }
              },
              child: const Text("Adicionar"),
            ),
          ],
        ),
      ),
    );
  }
}
