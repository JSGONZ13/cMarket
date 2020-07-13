import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmarket/Catalogo/local.dart';
import 'package:flutter/material.dart';

class AddLocal extends StatefulWidget {
  @override
  _AddLocalState createState() => _AddLocalState();
}

class _AddLocalState extends State<AddLocal> {
  String texto;

  TextEditingController nombreLocal = new TextEditingController();
  TextEditingController lineaComercial = new TextEditingController();
  TextEditingController direccion = new TextEditingController();
  TextEditingController telefono = new TextEditingController();
  TextEditingController nombreBarrio = new TextEditingController();
  TextEditingController horario = new TextEditingController();
  TextEditingController parqueadero = new TextEditingController();
  TextEditingController servicioDomicilio = new TextEditingController();
  TextEditingController descripcion = new TextEditingController();
  TextEditingController tarjetaCredito = new TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String textoAux = ModalRoute.of(context).settings.arguments;
    setState(() {
      if (textoAux != null) {
        texto = textoAux;
        nombreBarrio.text = texto;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E8AC9),
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Ingresar nuevo Local',
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        margin: EdgeInsets.all(16),
        child: ListView(
          addAutomaticKeepAlives: false,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Local:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: nombreLocal)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Línea Comercial:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: lineaComercial)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Descripción del local:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: descripcion)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Teléfono:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: telefono)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Horario de atención:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: horario)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Barrio:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: nombreBarrio)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: 'Dirección:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: direccion)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: '¿Acepta tarjeta de crédito?:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: tarjetaCredito)),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: '¿Tiene servicio a domicilio?:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: servicioDomicilio)),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20.0),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: new BorderSide(
                                color: Color(0xFF0E8AC9), width: 0.0)),
                        fillColor: Color(0xFFF9F9F9),
                        labelText: '¿Tiene parqueadero?:   ',
                        labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                    controller: parqueadero)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF0E8AC9),
          child: Icon(
            Icons.check,
            color: Color(0xFFF9F9F9),
          ),
          onPressed: () {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('¿Deseas agregar el nuevo local?: '),
                    content: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Nombre: " + nombreLocal.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Línea comercial: " + lineaComercial.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Descripción: " + descripcion.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Teléfono: " + telefono.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Horario de atención: " + horario.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Barrio: " + nombreBarrio.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Dirección: " + direccion.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "¿Acepta tarjeta de crédito?: " +
                                  tarjetaCredito.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "¿Tiene servicio a domicilio?: " +
                                  servicioDomicilio.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "¿Tiene parqueadero?: " + parqueadero.text,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    actions: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10),
                          child: FlatButton(
                            color: Color(0x00F2F2F2),
                            splashColor: Color(0x00F2F2F2),
                            onPressed: () {
                              if (nombreLocal.text != "" &&
                                  nombreBarrio.text != "" &&
                                  horario.text != "" &&
                                  telefono.text != "" &&
                                  direccion.text != "" &&
                                  lineaComercial.text != "" &&
                                  parqueadero.text != "" &&
                                  servicioDomicilio.text != "" &&
                                  tarjetaCredito.text != "") {
                                Local aux = new Local(
                                    nombreLocal.text,
                                    nombreBarrio.text,
                                    horario.text,
                                    telefono.text,
                                    direccion.text,
                                    lineaComercial.text,
                                    descripcion.text,
                                    parqueadero.text,
                                    servicioDomicilio.text,
                                    tarjetaCredito.text);
                                addData(aux);
                                print("Registro Exitoso");
                                Navigator.of(context).pop();
                                return showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    title: Text('Registro exitoso!'),
                                    content: Text(nombreLocal.text+" ha sido registrado.\nLa información ingresada será verificada."),
                                  );
                                });
                              } else {
                                Navigator.of(context).pop();
                                return showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    title: Text('No se pudo completar registro'),
                                    content: Text('Revise los datos faltantes'),
                                  );
                                });
                              }
                            },
                            child: Text(
                              'Registrar Local',
                              style: TextStyle(color: Color(0xFF0E8AC9)),
                            ),
                          ))
                    ],
                  );
                });
          }),
    );
  }

  void addData(Local local) async {
    var firestoreADD = Firestore.instance;
    firestoreADD.collection('locales').document().setData({
      "descripcion": local.descripcion,
      "direccion": local.direccion,
      "horario": local.horario,
      "lineaComercial": local.lineaComercial,
      "nombreBarrio": local.nombreBarrio,
      "parqueadero": local.parqueadero,
      "servicioDomicilio": local.servicioDomicilo,
      "tarjetaCredito": local.tarjetaCredito,
      "telefono": local.telefono
    });
  }
}
