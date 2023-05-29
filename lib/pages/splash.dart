import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/home_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: SizedBox(
              height: height * .3,
              width: width,
              child:
                  Image(image: AssetImage('images/tic-tac-toe_splash.png')))),
    );
  }
}
