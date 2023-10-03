import 'package:flutter/material.dart';
import 'package:todo/Home/Home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.rountname,
      routes: {
        HomeScreen.rountname: (context) => HomeScreen(),
      },
    );
  }
}
