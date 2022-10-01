import 'package:flame/components.dart';

class Creep extends CircleComponent {
  Creep(this.screen, {this.posstion})
      : super(
            position: posstion ?? Vector2.all(100),
            radius: 10,
            anchor: Anchor.center);

  final Vector2 screen;
  final Vector2? posstion;

  var width = 1;
  var height = 1;

  @override
  bool get debugMode => true;

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
