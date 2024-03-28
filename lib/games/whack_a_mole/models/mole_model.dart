part of '../main.dart';

enum MoleType {
  normal,
  bomber,
  none;
}

class MoleModel {
  MoleModel({
    this.index = 0,
    this.type = MoleType.none,
    this.isTapped = false,
  });

  MoleType type;
  int index;
  bool isTapped;

  @override
  String toString() {
    return 'MoleModel(index: $index, type: $type, isTapped: $isTapped)';
  }
}
