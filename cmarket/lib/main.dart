import 'package:cmarket/Catalogo/catalogo.dart';
import 'package:cmarket/Home/home.dart';
import 'package:cmarket/Ingresos/ingresoLocal.dart';
import 'package:cmarket/Local/LocalOnly.dart';
import 'package:cmarket/Login/login.dart';
import 'package:cmarket/Mapa/map.dart';
import 'package:cmarket/Menu/menu.dart';
import 'package:cmarket/Models/user.dart';
import 'package:cmarket/Services/auth.dart';
import 'package:cmarket/UserRegister.dart/userRegister.dart';
import 'package:cmarket/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/home': (context) => Home(),
        '/':(context) => Wrapper(),
        '/uRegister': (context) => UserRegister(),
        '/login': (context) => Login(),
        '/mapa': (context) => Mapa(),
        '/menu': (context) => Menu(),
        '/catalogo':(context) => Catalogo(),
        '/localOnly': (context) => LocalOnly(),
        '/ingresoLocal':(context) => AddLocal(),
      }),
    );
  }
}
