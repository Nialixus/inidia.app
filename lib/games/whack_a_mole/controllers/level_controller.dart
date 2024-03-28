part of '../main.dart';

class LevelController extends ChangeNotifier {
  LevelController({
    Duration initialDuration = const Duration(minutes: 1),
    int totalMoles = 15,
  })  : _initialDuration = initialDuration,
        _length = totalMoles;

  final Duration _initialDuration;
  final int _length;

  late Duration countdown = _initialDuration;
  late List<MoleModel> moles = [
    for (int i = 0; i < _length; i++) MoleModel(index: i)
  ];

  bool get isGameOver {
    final result = countdown.inSeconds <= 0;
    if (result) {
      _stoppedAt = DateTime.now();
      countdown = Duration.zero;
    }
    return result;
  }

  DateTime? _startedAt;
  DateTime? _stoppedAt;
  Duration? get result {
    if (_startedAt == null || _stoppedAt == null) return null;
    return _stoppedAt!.difference(_startedAt!);
  }

  Future<void> start({bool isFirstTime = true}) async {
    if (isFirstTime) {
      countdown = _initialDuration;
      _startedAt = DateTime.now();
    }
    if (!isGameOver) {
      await Future.delayed(const Duration(seconds: 1));
      countdown = countdown - const Duration(seconds: 1);
      for (var mole in moles) {
        moles[mole.index] = mole
          ..isTapped = false
          ..type = MoleType.values
              .where((e) => e != mole.type)
              .toList()[Random().nextInt(2)];
      }

      notifyListeners();
      await start(isFirstTime: false);
    } else {
      return;
    }
  }

  Future<void> stop() async {
    if (!isGameOver) countdown = const Duration(seconds: 1);
  }

  Future<void> onTap(MoleModel value) async {
    if (!isGameOver && !value.isTapped) {
      if (value.type == MoleType.bomber) {
        countdown -= const Duration(seconds: 5);
      } else if (value.type == MoleType.normal) {
        countdown += const Duration(seconds: 1);
      }

      moles[value.index] = value..isTapped = true;
      notifyListeners();
    }
  }
}
