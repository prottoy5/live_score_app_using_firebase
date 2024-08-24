import 'package:firebase_app/ui/screens/match_list_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MatchListScreen(),
      theme: _lightTheme(),
    );
  }
  ThemeData _lightTheme(){
    return ThemeData(

    );
  }
}




