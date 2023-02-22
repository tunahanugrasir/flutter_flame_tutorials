import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'game_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'War Of Tanks',
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}
