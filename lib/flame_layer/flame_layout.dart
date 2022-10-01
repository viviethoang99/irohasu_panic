import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:irohasu_panic/flame_layer/iroha_game.dart';
import 'package:irohasu_panic/flutter_layer/button_controller.dart';

class FlameLayout extends StatelessWidget {
  const FlameLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: IrohaGame(),
      overlayBuilderMap: {
        'ButtonController': (BuildContext context, IrohaGame game) {
          return ButtonController(game: game);
        }
      },
    );
  }
}
