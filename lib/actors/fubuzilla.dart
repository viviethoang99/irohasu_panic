import 'package:flame/components.dart';

class Fubuzilla extends SpriteComponent with HasGameRef {
  Fubuzilla(
    this.screen,
  ) : super(position: Vector2.all(100), size: Vector2.all(100)) {
    debugMode = true;
  }

  final Vector2 screen;

  var width = 1;
  var height = 1;

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('fubuzilla.png');
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (position[0] <= 0) {
      width = 1;
    } else if (position[0] >= screen[0] - size[0]) {
      width = -1;
    }
    if (position[1] <= 0) {
      height = 1;
    }
    if (position[1] >= screen[1] - size[1]) {
      height = -1;
    }
    x += width;
    y += height;
    super.update(dt);
  }
}
