import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/widget/numberOfPlayers.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../my_provider.dart';
import '../widget/player_button.dart';
import '../widget/restartbutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late MyProvider watch;
  TextStyle switchTextStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  late MyProvider read;
  late List<Widget> myItems;
  late String player;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => const NumOfPlayers());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    watch = context.watch<MyProvider>();
    read = context.read<MyProvider>();
    player = watch.activePlayer == ActivePlayer.x ? 'X' : 'O';
    myItems = List.generate(
        9,
        (index) => button(
              activePlayer: watch.activePlayer,
              index: index,
              gameOver: watch.gameOver,
            ));

    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: MediaQuery.of(context).orientation != Orientation.landscape
                ? Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    firstPart(),
                    const SizedBox(
                      height: 10,
                    ),
                    x_oPart(),
                    const SizedBox(
                      height: 100,
                    ),
                    finalPart(),
                    const SizedBox(
                      height: 20,
                    ),
                  ])
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [firstPart(), finalPart()],
                        ),
                      ),
                      x_oPart()
                    ],
                  )),
      ),
    );
  }

  Column finalPart() {
    return Column(
      children: [
        Text(watch.turns != null ? 'Number Of Turns ${watch.turns}' : '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(
          height: 10,
        ),
        const restartB(),
      ],
    );
  }

  Expanded x_oPart() {
    return Expanded(
      child: Stack(
        children: [
          GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: myItems,
          ),
          /* watch.gameOver
                    ? CustomPaint(
                        painter: MyPainter(
                            color: watch.result != 'X'
                                ? Colors.pink
                                : Colors.blue),
                        size: Size(constarints.maxWidth - 10,
                            constarints.maxHeight),
                      )
                    : const SizedBox()*/
        ],
      ),
    );
  }

  Widget firstPart() {
    return Column(
      children: [
        AnimatedToggleSwitch.dual(
          current: watch.current,
          first: false,
          second: true,
          colorBuilder: (value) => value ? null : Theme.of(context).splashColor,
          borderColor: Theme.of(context).splashColor.withOpacity(.7),
          indicatorSize: Size(40, 40),
          textBuilder: (value) => value
              ? Center(
                  child: FittedBox(
                    child: Text(
                      'Light',
                      style: switchTextStyle,
                    ),
                  ),
                )
              : Center(
                  child: FittedBox(
                    child: Text(
                      'Dark',
                      style: switchTextStyle,
                    ),
                  ),
                ),
          onChanged: (value) {
            setState(() {
              read.setCurrent = value;
            });
          },
          borderWidth: 2.5,
          iconBuilder: (value) => Icon(value ? Icons.sunny : Icons.nightlight),
        ),
        Text(
            !watch.gameOver
                ? "It's $player turn"
                : watch.result != 'X' && watch.result != 'O'
                    ? "it's a ${watch.result}"
                    : '${watch.result ?? ""} is the Winner',
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
