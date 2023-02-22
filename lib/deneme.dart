import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class TapToAddComponent extends PositionComponent with HasGameRef {
  static const radius = 10.0;
  static const speed = 500.0;
  static const degree = math.pi / 180;

  Paint paint = Paint()..color = Colors.white;
  late Vector2 velocity;

  TapToAddComponent() {
    final hitBox = CircleHitbox(radius: radius);
    add(hitBox);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    resetBall();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;

    final rect = toRect();
    if (rect.left <= 0) {
      position.x = radius;
      velocity.x = -velocity.x;
    } else if (rect.right >= gameRef.size.x) {
      position.x = gameRef.size.x - radius;
      velocity.x = -velocity.x;
    }
    if (rect.top <= 0) {
      position.y = radius;
      velocity.y = -velocity.y;
    } else if (rect.bottom >= gameRef.size.y) {
      position.y = gameRef.size.y - radius;
      velocity.y = -velocity.y;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(const Offset(radius, radius), radius, paint);
  }

  void resetBall() {
    position = gameRef.size / 2;
    final spawnAngle = getSpawnAngle();

    final vx = math.cos(spawnAngle * degree) * speed;
    final vy = math.sin(spawnAngle * degree) * speed;

    velocity = Vector2(vx, vy);
  }

  double getSpawnAngle() {
    final random = math.Random().nextDouble();
    final spawnAngle = lerpDouble(0, 360, random)!;
    return spawnAngle;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ScreenHitbox) {
      final collisionPoint = intersectionPoints.first;

      if (collisionPoint.x <= 0 || collisionPoint.x >= gameRef.size.x) {
        velocity.x = -velocity.x;
      }
      if (collisionPoint.y <= 0 || collisionPoint.y >= gameRef.size.y) {
        velocity.y = -velocity.y;
      }
    }
  }

  @override
  bool destroy() => false;
}
