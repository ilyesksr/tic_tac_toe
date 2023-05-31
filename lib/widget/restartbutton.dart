import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/my_provider.dart';
import 'package:tic_tac_toe/widget/numberOfPlayers.dart';

class restartB extends StatelessWidget {
  const restartB({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<MyProvider>().reset();
        showDialog(
            context: context, builder: (context) => const NumOfPlayers());
      },
      icon: const Icon(Icons.restart_alt),
      label: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Play Again',
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).splashColor),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }
}
