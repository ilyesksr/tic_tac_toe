import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/my_provider.dart';

class Game {
  late Random random = Random();
  late int index;
  void playGame(int index, ActivePlayer activePlayer) {
    if (activePlayer == ActivePlayer.x) {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
    Player.empty.remove(index);
  }

  void autoPlay(ActivePlayer activePlayer, BuildContext context) {
    if (Player.empty.isNotEmpty) {
      switch (context.read<MyProvider>().level) {
        case Levels.easy:
          easy(activePlayer);
          break;
        case Levels.medium:
          medium(activePlayer);
          break;
        case Levels.hard:
          hard(activePlayer);
          break;
      }
      context.read<MyProvider>().incrementTurns();
    }
  }

  void easy(ActivePlayer activePlayer) {
    game.playGame(Player.empty.elementAt(random.nextInt(Player.empty.length)),
        activePlayer);
  }

  void medium(ActivePlayer activePlayer) {
    random.nextInt(3) != 0 ? hard(activePlayer) : easy(activePlayer);
  }

  void hard(ActivePlayer activePlayer) {
    //win
    if (Player.playerO.containsAll([0, 1]) && Player.empty.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAll([3, 4]) && Player.empty.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll([6, 7]) && Player.empty.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll([0, 3]) && Player.empty.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll([1, 4]) && Player.empty.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAll([2, 5]) && Player.empty.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll([0, 4]) && Player.empty.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAll([2, 4]) && Player.empty.contains(6)) {
      index = 6;
    }
    //
    else if (Player.playerO.containsAll([1, 7]) && Player.empty.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll([0, 6]) && Player.empty.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll([2, 8]) && Player.empty.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAll([0, 2]) && Player.empty.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll([3, 5]) && Player.empty.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAll([6, 8]) && Player.empty.contains(7)) {
      index = 7;
    }
    //
    else if (Player.playerO.containsAll([1, 2]) && Player.empty.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll([4, 5]) && Player.empty.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAll([7, 8]) && Player.empty.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAll([3, 6]) && Player.empty.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAll([4, 7]) && Player.empty.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAll([5, 8]) && Player.empty.contains(2)) {
      index = 2;
    } //5esser

    else if (Player.playerX.containsAll([0, 1]) && Player.empty.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll([3, 4]) && Player.empty.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll([6, 7]) && Player.empty.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll([0, 3]) && Player.empty.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll([1, 4]) && Player.empty.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAll([2, 5]) && Player.empty.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll([0, 4]) && Player.empty.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAll([2, 4]) && Player.empty.contains(6)) {
      index = 6;
    }
    //
    else if (Player.playerX.containsAll([1, 7]) && Player.empty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll([0, 6]) && Player.empty.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll([2, 8]) && Player.empty.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAll([0, 2]) && Player.empty.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll([3, 5]) && Player.empty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll([6, 8]) && Player.empty.contains(7)) {
      index = 7;
    }
    //
    else if (Player.playerX.containsAll([1, 2]) && Player.empty.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll([4, 5]) && Player.empty.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAll([7, 8]) && Player.empty.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAll([3, 6]) && Player.empty.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll([4, 7]) && Player.empty.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAll([5, 8]) && Player.empty.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAll([0, 8]) && Player.empty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll([4, 8]) && Player.empty.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAll([2, 6]) && Player.empty.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAll([4, 6]) && Player.empty.contains(2)) {
      index = 4;
    }
    //or
    else {
      random = Random();
      index = Player.empty.elementAt(random.nextInt(Player.empty.length));
    }
    game.playGame(index, activePlayer);
  }

  void checkWinner(BuildContext context) {
    if (Player.playerX.containsAll([0, 1, 2]) ||
        Player.playerX.containsAll([3, 4, 5]) ||
        Player.playerX.containsAll([6, 7, 8]) ||
        Player.playerX.containsAll([0, 3, 6]) ||
        Player.playerX.containsAll([1, 4, 7]) ||
        Player.playerX.containsAll([2, 5, 8]) ||
        Player.playerX.containsAll([0, 4, 8]) ||
        Player.playerX.containsAll([2, 4, 6])) {
      context.read<MyProvider>().setResult = 'X';
    } else if (Player.playerO.containsAll([0, 1, 2]) ||
        Player.playerO.containsAll([3, 4, 5]) ||
        Player.playerO.containsAll([6, 7, 8]) ||
        Player.playerO.containsAll([0, 3, 6]) ||
        Player.playerO.containsAll([1, 4, 7]) ||
        Player.playerO.containsAll([2, 5, 8]) ||
        Player.playerO.containsAll([0, 4, 8]) ||
        Player.playerO.containsAll([2, 4, 6])) {
      context.read<MyProvider>().setResult = 'O';
    }
    if (context.read<MyProvider>().result != null) {
      context.read<MyProvider>().setgameOver = true;
    }
  }
}

Game game = Game();

class Player {
  static Set<int> playerX = {};
  static Set<int> playerO = {};
  static Set<int> empty = {0, 1, 2, 3, 4, 5, 6, 7, 8};
}
