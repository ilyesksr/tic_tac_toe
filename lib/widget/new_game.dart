import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../my_provider.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  List<bool> oneTwoPlayer = [false, false];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).canvasColor,
      title: const FittedBox(child: Text('Choose One Of the Levels')),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 8,
        ),
        levelButton('Hard', Levels.hard, context),
        const SizedBox(
          height: 8,
        ),
        levelButton('Medium', Levels.medium, context),
        const SizedBox(
          height: 8,
        ),
        levelButton('Easy', Levels.easy, context),
      ]),
    );
  }

  SizedBox levelButton(String levelName, Levels level, BuildContext context) =>
      SizedBox(
        width: 100,
        child: ElevatedButton(
            onPressed: () {
              context.read<MyProvider>().setLevel = level;
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).splashColor,
            )),
            child: FittedBox(child: Text(levelName))),
      );
}
