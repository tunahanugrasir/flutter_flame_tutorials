import 'package:flame/game.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'game.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  WarOfTanks game = WarOfTanks();
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game);
  }
}
