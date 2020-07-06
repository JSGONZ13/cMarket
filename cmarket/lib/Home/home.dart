import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
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
                image: AssetImage('resources/logoMarca.png'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            )),
        Container(
            margin: EdgeInsets.only(top: 20.0, left: 16, right: 16),
            child: ButtonTheme(
                minWidth: 150.0,
                height: 50.0,
                child: RaisedButton(
                    onPressed: () {
                      //print('Botón Funcionando');
                      Navigator.of(context).pushNamed('/menu');
                    },
                    child: Text(
                      'Empezar',
                      style: TextStyle(color: Color(0xFFF2F2F2)),
                    ),
                    color: Color(0xFF0E8AC9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)))))
      ],
    )))));
  }
}
