import 'package:cmarket/Estilos/estilos.dart';
import 'package:flutter/material.dart';

TextEditingController usuario = new TextEditingController();
TextEditingController contrasenia = new TextEditingController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
            child: Container(
                child: Center(
                    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Center(
              child: Image(
                image: AssetImage(
                  'resources/logoMarca.png'
                ),
                fit: BoxFit.cover,
              ),
            )),
        Container(
            margin: EdgeInsets.only(top: 20.0, left: 16, right: 16),
            child: ButtonTheme(
                minWidth: 150.0,
                height: 50.0,
                child: RaisedButton(
                    child: Text(
                      'EMPEZAR',
                      style: TextStyle(color: Color(0xFFF2F2F2)),
                    ),
                    color: Color(0xFF0E8AC9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)))))
      ],
    )))));
  }
}
