library whack_a_mole;

import 'package:flutter/material.dart';

part 'controllers/level_controller.dart';
part 'views/game_over_view.dart';
part 'views/level_view.dart';
part 'views/mole_view.dart';

typedef WhackAMole = LevelView;

String countdown(Duration duration) {
  final minute = '${duration.inMinutes}'.padLeft(2, '0');
  final second = '${duration.inSeconds.remainder(60)}'.padLeft(2, '0');
  return '$minute:$second';
}
