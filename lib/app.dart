import 'package:flutter/material.dart';
import 'package:pacman/game_page.dart';
import 'package:pacman/menu_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PacMan - 2H3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (_) => const MenuPage(),
        '/game': (_) => const GamePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
