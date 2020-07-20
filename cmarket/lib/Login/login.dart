import 'package:cmarket/Services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService auth = new AuthService();
  bool aux = true;
  TextEditingController emailController = new TextEditingController();
  TextEditingController contrasenaController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 50),
          child: ListView(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Center(
                    child: Image(
                      image: AssetImage('resources/logoMarca.png'),
                      filterQuality: FilterQuality.high,
                      height: 230,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.all(16),
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
                          labelText: 'E-mail:   ',
                          labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                      controller: emailController)),
              Container(
                  margin: EdgeInsets.all(16),
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
                          labelText: 'Contraseña:   ',
                          labelStyle: TextStyle(color: Color(0xFF0E8AC9))),
                      controller: contrasenaController)),
              Container(
                margin: EdgeInsets.all(16),
                child: ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: () async {
                          //print('Botón Funcionando');
                          //Navigator.of(context).pushNamed('/menu');
                          dynamic result = await auth.signInEmailPwd(
                              emailController.text, contrasenaController.text);
                          if (result == null) {
                            print('Error');
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: Text('Ingreso fallido'),
                                    content:
                                        Text('Email o contraseña erróneos'),
                                  );
                                });
                          } else {
                            Navigator.of(context).pop();
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: Text(''),
                                    content: Text('Ingreso al sistema exitoso'),
                                  );
                                });
                          }
                          print(result);
                          setState(() {
                            emailController.text = "";
                            contrasenaController.text = "";
                          });
                        },
                        child: Text(
                          'Ingresar',
                          style: TextStyle(color: Color(0xFFF2F2F2)),
                        ),
                        color: Color(0xFF0E8AC9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)))),
              ),
              Container(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/uRegister');
                      },
                      child: Text(
                        'Registrarme ahora',
                        style: TextStyle(color: Color(0xFF969456)),
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
