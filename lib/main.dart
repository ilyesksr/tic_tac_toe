import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/my_provider.dart';
import 'package:tic_tac_toe/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProvider(),
      builder: (ctx, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tac Toe',
        theme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 0, 25, 105),
            canvasColor: Color.fromARGB(255, 0, 12, 51),
            splashColor: const Color(0xFF4169e8)),
        home: const SplashPage(),
      ),
    );
  }
}
