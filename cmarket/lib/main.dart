import 'package:cmarket/Catalogo/catalogo.dart';
import 'package:cmarket/Local/LocalOnly.dart';
import 'package:cmarket/Mapa/map.dart';
import 'package:flutter/material.dart';

import 'Home/home.dart';
import 'Menu/menu.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => Home(),
      '/mapa': (context) => Mapa(),
      '/menu': (context) => Menu(),
      '/catalogo':(context) => Catalogo(),
      '/localOnly': (context) => LocalOnly()
    });
  }
}
