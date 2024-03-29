library whack_a_mole;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

part 'controllers/level_controller.dart';
part 'models/mole_model.dart';
part 'views/game_over_view.dart';
part 'views/level_view.dart';
part 'views/mole_view.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Whack A Mole',
      home: LevelView(),
    ),
  );
}
