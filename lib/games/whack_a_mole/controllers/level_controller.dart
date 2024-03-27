part of '../main.dart';

class LevelController extends ChangeNotifier {
  LevelController({
    Duration initialDuration = const Duration(minutes: 1),
  }) : _countdown = initialDuration;

  Duration _countdown = const Duration(seconds: 3);
  Duration get countdown => _countdown;
  set countdown(Duration value) {
    _countdown = value;
    notifyListeners();
  }

  bool get isGameOver => countdown.inSeconds <= 0;

  Future<void> start({Duration? duration}) async {
    if (duration != null) countdown = duration;
    if (!isGameOver) {
      await Future.delayed(const Duration(seconds: 1));
      countdown = countdown - const Duration(seconds: 1);
      await start();
    } else {
      return;
    }
  }

  Future<void> stop() async {
    if (!isGameOver) countdown = const Duration(seconds: 1);
  }
}
