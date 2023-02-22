import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:war_of_tanks/deneme.dart';

class WarOfTanks extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    addAll([ScreenHitbox(), TapToAddComponent()]);
  }
}
