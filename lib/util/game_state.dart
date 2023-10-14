import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pacman/util/sounds.dart';

class GameState extends ChangeNotifier {
  static final GameState _instance = GameState._internal();

  factory GameState() {
    return _instance;
  }

  GameState._internal();

  final Duration _timePower = const Duration(seconds: 10);
  List<ValueChanged<bool>> onChangePowerObserves = [];
  Future? _powerTimer;

  int _score = 0;
  int _lives = 3;
  bool _pacManWithPower = false;

  bool get pacManWithPower => _pacManWithPower;
  int get score => _score;
  int get lives => _lives;

  void incrementScore({int value = 10}) {
    _score += value;
    notifyListeners();
  }

  void decrementLife() {
    _lives -= 1;
    notifyListeners();
  }

  void startPacManPower() {
    _powerTimer?.ignore();
    _pacManWithPower = true;

    for (var element in onChangePowerObserves) {
      element(_pacManWithPower);
    }

    Sounds.playPowerBackgroundSound();

    _powerTimer = Future.delayed(_timePower, () {
      //when power time is gone, set all to prior conditions
      _pacManWithPower = false;

      for (var element in onChangePowerObserves) {
        element(_pacManWithPower);
      }

      Sounds.stopBackgroundSound();
      notifyListeners();
    }).catchError((e) {
      log(e.toString());
    });

    notifyListeners();
  }

  void listenChangePower(ValueChanged<bool> onChange) {
    onChangePowerObserves.add(onChange);
  }

  void reset() {
    _score = 0;
    _lives = 3;

    onChangePowerObserves.clear();
  }
}