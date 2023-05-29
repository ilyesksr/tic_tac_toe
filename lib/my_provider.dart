import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_Logic.dart';

enum ActivePlayer {
  x,
  o;
}

enum Levels {
  hard,
  medium,
  easy,
}

class MyProvider with ChangeNotifier {
  ActivePlayer _activePlayer = ActivePlayer.x;
  bool _gameOver = false;
  int? _turns;
  String? _result;
  bool _twoPlayer = false;
  Levels? _levels;
  set setLevel(Levels level) {
    _levels = level;
    notifyListeners();
  }

  get level => _levels;

  set setPlayer(ActivePlayer activePlayer) {
    _activePlayer = activePlayer;
    notifyListeners();
  }

  set setgameOver(bool gameOver) {
    _gameOver = gameOver;
    notifyListeners();
  }

  set setResult(String result) {
    _result = result;
    notifyListeners();
  }

  set setTwoPlayer(bool twoPlayer) {
    _twoPlayer = twoPlayer;
    notifyListeners();
  }

  void incrementTurns() {
    _turns = _turns != null ? _turns! + 1 : 1;
    notifyListeners();
  }

  get activePlayer => _activePlayer;

  get gameOver => _gameOver;

  get turns => _turns;

  get result => _result;
  get twoPlayer => _twoPlayer;

  void reset() {
    _activePlayer = ActivePlayer.x;
    _gameOver = false;
    _turns = null;
    _result = null;
    Player.playerX = {};
    Player.playerO = {};
    Player.empty = {0, 1, 2, 3, 4, 5, 6, 7, 8};
    _levels = null;
    _twoPlayer = false;

    notifyListeners();
  }
}
