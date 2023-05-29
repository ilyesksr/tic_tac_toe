import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/my_provider.dart';
import 'package:tic_tac_toe/widget/new_game.dart';

class NumOfPlayers extends StatefulWidget {
  const NumOfPlayers({super.key});

  @override
  State<NumOfPlayers> createState() => _NumOfPlayersState();
}

class _NumOfPlayersState extends State<NumOfPlayers> {
  List<bool> oneTwoPlayer = [false, false];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      title: const FittedBox(
        child: Text(
          'How would you like to play',
        ),
      ),
      content: FittedBox(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).splashColor,
          ),
          height: 50,
          child: ToggleButtons(
            isSelected: oneTwoPlayer,
            renderBorder: true,
            borderColor: Colors.white,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(30),
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: const Row(
                    children: [
                      Icon(Icons.games_outlined),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'One Player',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Row(
                  children: [
                    Icon(Icons.games_rounded),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Two Players',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
            onPressed: (index) {
              setState(() {
                if (index != 0) {
                  oneTwoPlayer[index - 1] = false;
                  oneTwoPlayer[index] = true;
                  context.read<MyProvider>().setTwoPlayer = true;
                  Navigator.of(context).pop();
                } else {
                  oneTwoPlayer[index] = true;
                  oneTwoPlayer[index + 1] = false;
                  context.read<MyProvider>().setTwoPlayer = false;
                  Navigator.of(context).pop();
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) => const NewGame());
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
