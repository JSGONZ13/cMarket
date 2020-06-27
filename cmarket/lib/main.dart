import 'package:cmarket/Mapa/map.dart';
import 'package:flutter/material.dart';

import 'Home/home.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(), 
        '/mapa': (context) => Mapa()},
    );
  }
}
