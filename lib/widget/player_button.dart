import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_Logic.dart';
import 'package:tic_tac_toe/my_provider.dart';

class button extends StatelessWidget {
  final ActivePlayer activePlayer;
  final bool gameOver;
  final int index;
  late MyProvider watch;
  late MyProvider read;
  late String player;
  late ActivePlayer ac_change_1, ac_change_2;
  button(
      {super.key,
      required this.activePlayer,
      required this.index,
      required this.gameOver});

  @override
  Widget build(BuildContext context) {
    watch = context.watch<MyProvider>();
    read = context.read<MyProvider>();
    player = Player.playerX.contains(index)
        ? 'X'
        : Player.playerO.contains(index)
            ? 'O'
            : '';
    return TextButton(
      onPressed: !gameOver
          ? () {
              if (!((Player.playerO.contains(index) ||
                      Player.playerX.contains(index)) &&
                  activePlayer == ActivePlayer.x)) {
                onTap(context);
              }
            }
          : () {
              print('ma9erote');
              return;
            },
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).primaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        player,
        style: TextStyle(
            fontSize: 60, color: player == 'X' ? Colors.blue : Colors.pink),
      ),
    );
  }

  void onTap(BuildContext context) async {
    read.incrementTurns();
    game.playGame(index, activePlayer);
    game.checkWinner(context);
    if (context.read<MyProvider>().result == null) {
      ac_change_1 =
          activePlayer == ActivePlayer.x ? ActivePlayer.o : ActivePlayer.x;
      read.setPlayer = ac_change_1;
    }

    if (!(watch.twoPlayer || watch.gameOver)) {
      await Future.delayed(
        const Duration(milliseconds: 400),
        () => game.autoPlay(ac_change_1, context),
      );

      ac_change_2 =
          ac_change_1 == ActivePlayer.x ? ActivePlayer.o : ActivePlayer.x;
      read.setPlayer = ac_change_2;
    }
    game.checkWinner(context);
    if (context.read<MyProvider>().result != null) {
      context.read<MyProvider>().setgameOver = true;
    } else if (context.read<MyProvider>().turns >= 9) {
      context.read<MyProvider>().setgameOver = true;
      context.read<MyProvider>().setResult = 'Draw';
    }
  }
}
