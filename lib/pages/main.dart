// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/game/game_cubit.dart'; // Certifique-se de que o caminho está correto
import '../pages/home_page.dart'; // Certifique-se de que o caminho está correto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),  // Fornecendo o GameCubit para a árvore de widgets
      child: MaterialApp(
        title: 'Lista de Desejos de Jogos',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),  // Certifique-se de que HomePage é uma classe de widget
      ),
    );
  }
}
