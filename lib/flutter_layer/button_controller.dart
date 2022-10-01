import 'package:flutter/material.dart';
import 'package:irohasu_panic/flame_layer/iroha_game.dart';

class ButtonController extends StatelessWidget {
  const ButtonController({super.key, required this.game});

  final IrohaGame game;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.volume_up_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        print('pressed volume up');
      },
    );
  }
}
