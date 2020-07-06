import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: (Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 20.0, left: 16, right: 16),
            child: ButtonTheme(
                minWidth: 150.0,
                height: 50.0,
                child: RaisedButton(
                    onPressed: () {
                      //print('Botón Funcionando');
                      Navigator.of(context).pushNamed('/mapa');
                    },
                    child: Text(
                      'Mapa',
                      style: TextStyle(color: Color(0xFFF2F2F2)),
                    ),
                    color: Color(0xFF0E8AC9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0))))),
        Container(
            margin: EdgeInsets.only(top: 20.0, left: 16, right: 16),
            child: ButtonTheme(
                minWidth: 150.0,
                height: 50.0,
                child: RaisedButton(
                    onPressed: () {
                      //print('Botón Funcionando');
                      Navigator.of(context).pushNamed('/catalogo');
                    },
                    child: Text(
                      'Catálogo',
                      style: TextStyle(color: Color(0xFFF2F2F2)),
                    ),
                    color: Color(0xFF0E8AC9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)))))
      ],
    ))));
  }
}
