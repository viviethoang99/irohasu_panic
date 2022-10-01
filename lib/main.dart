import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:irohasu_panic/flame_layer/flame_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Flame.device.setLandscape();
  // Flame.device.fullScreen();
  runApp(const IrohasuPanic());
}

class IrohasuPanic extends StatelessWidget {
  const IrohasuPanic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: const [FlameLayout()],
          ),
        ),
      ),
    );
  }
}
