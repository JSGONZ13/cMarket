import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmarket/Services/auth.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  AuthService auth = AuthService();
  bool aux = true;

//Text Controllers
  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController contrasenaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0E8AC9),
          title: Container(
            child: Text(
              'Registro de usuario',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(16),
          child: ButtonTheme(
            minWidth: 150.0,
            height: 50.0,
            child: RaisedButton(
              color: Color(0xFF0E8AC9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              onPressed: () {
                if (nombreController.text == "" &&
                    apellidoController.text == "" &&
                    emailController.text == "" &&
                    contrasenaController.text == "") {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text('No se pudo completar registro'),
                          content: Text('Revise los datos faltantes'),
                        );
                      });
                } else {
                  dynamic result = auth.registerInEPwd(emailController.text, contrasenaController.text);
                  print(result);
                  var firestoreADD = Firestore.instance;
                  firestoreADD.collection('userProfiles').document().setData({
                    "nombre": nombreController.text,
                    "apellido": apellidoController.text,
                    "email": emailController.text
                  });
                  nombreController.text = "";
                  apellidoController.text = "";
                  emailController.text = "";
                  contrasenaController.text = "";
                  Navigator.of(context).pop();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Text('Registro completado'),
                          content:
                              Text('El usuario ha sido registrado con éxito'),
                        );
                      });
                }
              },
              child: Text(
                'Registrar',
                style: TextStyle(color: Color(0xFFF2F2F2)),
              ),
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 50),
            child: ListView(
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
                            labelText: 'Nombre',
                            labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                        controller: nombreController)),
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
                            labelText: 'Apellido',
                            labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                        controller: apellidoController)),
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
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                        controller: emailController)),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                        obscureText: aux,
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
                            suffixIcon: IconButton(
                                icon: Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    aux = !aux;
                                  });
                                }),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                        controller: contrasenaController)),
              ],
            )));
  }
}
