import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/pages/Pokedex/data.dart';

import 'package:pokemon/splashscreen/splashscreen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff061626),
        appBarTheme: AppBarTheme(
          color: Color(0xff05121F),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
