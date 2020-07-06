import 'package:cmarket/Catalogo/local.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalOnly extends StatefulWidget {
  @override
  _LocalOnlyState createState() => _LocalOnlyState();
}

class _LocalOnlyState extends State<LocalOnly> {
  Local local;

  @override
  void didChangeDependencies() {
    setState(() {
      local = ModalRoute.of(context).settings.arguments;
    });
    super.didChangeDependencies();
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('No se pudo llamar a: ' + command);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFFFCCC2B),
        body: new Center(
            child: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height - 170,
                margin: EdgeInsets.only(left: 16, right: 16, top: 60),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: ListTile(
                          title: Text(
                            local.nombreLocal,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          subtitle:
                              Text('Línea Comercial: ' + local.lineaComercial),
                        )),
                        Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.bottomLeft,
                          child: Text('<<Aquí va una descripción del lugar>>' +
                              local.descripcion),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.bottomLeft,
                          child: Text('Teléfono:  \n' + local.telefono),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.bottomLeft,
                          child:
                              Text('Horario de atención:  \n' + local.horario),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          alignment: Alignment.bottomLeft,
                          child: Text('Dirección: \n' + local.direccion),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          alignment: Alignment.bottomLeft,
                          child: Text('¿Acepta tarjetas de crédito?: ' +
                              local.tarjetaCredito),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 10),
                          alignment: Alignment.bottomLeft,
                          child: Text('¿Tiene servicio a domicilio?: ' +
                              local.servicioDomicilo),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 10),
                          alignment: Alignment.bottomLeft,
                          child:
                              Text('¿Tiene parqueadero?: ' + local.parqueadero),
                        )
                      ],
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          backgroundColor: Color(0xFF0E8AC9),
                          onPressed: () {
                            customLaunch('tel: ' + local.telefono);
                          },
                          child: Icon(Icons.call),
                        )),
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Text('¿Quieres comunicarte con este local?'),
                    )
                  ],
                ))
          ],
        )));
  }
}