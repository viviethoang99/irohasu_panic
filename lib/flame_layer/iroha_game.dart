import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame/widgets.dart';
import 'package:irohasu_panic/actors/fubuzilla.dart';

import '../actors/creep.dart';

class IrohaGame extends FlameGame with TapDetector {
  late SpriteAnimation downAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation rightAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation idleAnimation;

  late SpriteAnimationComponent george;

  int direction = 0;
  final animationSpeed = .1;
  final sizeCharacter = 80.0;
  final characterSpeed = 40;

  @override
  Future<void>? onLoad() async {
    // var rng = Random();
    // final screenWidth = size[0];
    // final screenHeight = size[1];
    // add(Fubuzilla(size));
    // add(Creep(
    //   size,
    //   posstion: Vector2(
    //     rng.nextDouble() * screenWidth,
    //     rng.nextDouble() * screenHeight,
    //   ),
    // ));
    // add(Creep(
    //   size,
    //   posstion: Vector2(
    //     rng.nextDouble() * screenWidth,
    //     rng.nextDouble() * screenHeight,
    //   ),
    // ));

    overlays.add('ButtonController');

    final spriteSheet = SpriteSheet(
        image: await images.load('george2.png'),
        srcSize: Vector2(
          48,
          48,
        ));

    downAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: animationSpeed,
      to: 4,
    );
    leftAnimation = spriteSheet.createAnimation(
      row: 1,
      stepTime: animationSpeed,
      to: 4,
    );
    upAnimation = spriteSheet.createAnimation(
      row: 2,
      stepTime: animationSpeed,
      to: 4,
    );
    rightAnimation = spriteSheet.createAnimation(
      row: 3,
      stepTime: animationSpeed,
      to: 4,
    );
    idleAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: animationSpeed,
      to: 1,
    );

    george = SpriteAnimationComponent()
      ..animation = downAnimation
      ..position = Vector2.all(200)
      ..debugMode = true
      ..size = Vector2.all(sizeCharacter);

    add(george);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    switch (direction) {
      case 0:
        george.animation = idleAnimation;
        break;
      case 1:
        george.animation = downAnimation;
        if (george.y < size.y - george.height) {
          george.y += dt * characterSpeed;
        }
        break;
      case 2:
        george.animation = leftAnimation;
        if (george.x > 0) {
          george.x -= dt * characterSpeed;
        }
        break;
      case 3:
        george.animation = upAnimation;
        if (george.y > 0) {
          george.y -= dt * characterSpeed;
        }
        break;
      case 4:
        george.animation = rightAnimation;
        if (george.x < size.x - george.width) {
          george.x += dt * characterSpeed;
        }
        break;
      default:
        break;
    }
    super.update(dt);
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
    super.onTapUp(info);
  }
}
