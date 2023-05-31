import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/home_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInExpo));
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 1500)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const HomePage())));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            child: FadeTransition(
              opacity: _animationController,
              child: Image(image: AssetImage('images/tic-tac-toe_splash.png')),
            )),
      ),
    );
  }
}
