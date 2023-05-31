import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/my_provider.dart';
import 'package:tic_tac_toe/pages/splash.dart';
import 'package:tic_tac_toe/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await setData();
  runApp(ChangeNotifierProvider(
      create: (_) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      darkTheme: darkTheme,
      themeMode: myTheme(context.watch<MyProvider>().current),
      theme: ligthTheme,
      home: const SplashPage(),
    );
  }
}
