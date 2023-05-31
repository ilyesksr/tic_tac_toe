import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/game_Logic.dart';
import 'package:tic_tac_toe/my_provider.dart';
import 'package:tic_tac_toe/pages/home_Page.dart';

class button extends StatefulWidget {
  final ActivePlayer activePlayer;
  final bool gameOver;

  final int index;
  button(
      {super.key,
      required this.activePlayer,
      required this.index,
      required this.gameOver});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> with SingleTickerProviderStateMixin {
  late MyProvider watch;
  double _show = 0;
  late MyProvider read;

  late String player;

  late ActivePlayer ac_change_1, ac_change_2;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    watch = context.watch<MyProvider>();
    read = context.read<MyProvider>();
    player = Player.playerX.contains(widget.index)
        ? 'X'
        : Player.playerO.contains(widget.index)
            ? 'O'
            : '';
    return TextButton(
      onPressed: !widget.gameOver
          ? () {
              if (!((Player.playerO.contains(widget.index) ||
                      Player.playerX.contains(widget.index)) &&
                  widget.activePlayer == ActivePlayer.x)) {
                if (watch.twoPlayer) {
                  setState(() {
                    _show = 1;
                  });
                }
                onTap(context);
                //setState(() => test.myItems[widget.index] = 1);
              }
            }
          : null,
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).primaryColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: !watch.twoPlayer
          ? Text(
              player,
              style: TextStyle(
                  fontSize: 60,
                  color: player == 'X' ? Colors.blue : Colors.pink),
            )
          : AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: _show,
              child: Text(
                player,
                style: TextStyle(
                    fontSize: 60,
                    color: player == 'X' ? Colors.blue : Colors.pink),
              ),
            ),
    );
  }

  void onTap(BuildContext context) async {
    read.incrementTurns();
    game.playGame(widget.index, widget.activePlayer);
    game.checkWinner(context);
    if (context.read<MyProvider>().result == null) {
      ac_change_1 = widget.activePlayer == ActivePlayer.x
          ? ActivePlayer.o
          : ActivePlayer.x;
      read.setPlayer = ac_change_1;
    }

    if (!(watch.twoPlayer || watch.gameOver)) {
      await Future.delayed(
        const Duration(milliseconds: 400),
        () {
          game.autoPlay(ac_change_1, context);
        },
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
