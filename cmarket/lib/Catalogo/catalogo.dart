import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmarket/Catalogo/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catalogo extends StatefulWidget {
  @override
  @override
  _CatalogoState createState() => new _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  TextEditingController buscar = new TextEditingController();
  String texto;
  var result;
  Local localAux;
  List<Widget> wLocales = [];
  List<Local> locales = [];

  Widget localW;
  Future loadLocales(String texto) async {
    if (texto.isNotEmpty) {
      result = await Firestore.instance
          .collection('locales')
          .where('nombreBarrio', isEqualTo: texto)
          .getDocuments();
    } else {
      result = await Firestore.instance.collection('locales').getDocuments();
    }
    result.documents.forEach((res) {
      setState(() {
        localAux = Local(
            res.data['nombreLocal'],
            res.data['nombreBarrio'],
            res.data['horario'],
            res.data['telefono'],
            res.data['direccion'],
            res.data['lineaComercial'],
            res.data['descripcion'],
            res.data['parqueadero'],
            res.data['servicioDomicilio'],
            res.data['tarjetaCredito']);
        locales.add(localAux);
        localW = LocalCard(localAux);
        print(localAux.nombreLocal);
        wLocales.add(localW);
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String textoAux = ModalRoute.of(context).settings.arguments;
    setState(() {
      if (textoAux != null) {
        texto = textoAux;
        buscar.text = texto;
        loadLocales(texto);
      } else {
        texto = buscar.text;
        loadLocales(texto);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0E8AC9),
          title: TextField(
            style: TextStyle(color: Color(0xFFF2F2F2)),
            controller: buscar,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20.0),
                enabledBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        new BorderSide(color: Color(0x1A0E8AC9), width: 0.0)),
                focusedBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        new BorderSide(color: Color(0x1A0E8AC9), width: 0.0)),
                hintText: 'Buscar locales por barrio',
                hintStyle: TextStyle(color: Color(0xFFF2F2F2)),
                fillColor: Color(0xFFF9F9F9),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      locales.clear();
                      wLocales.clear();
                      texto = buscar.text;
                      loadLocales(texto);
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFFF2F2F2),
                  ),
                )),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height/1.4,
            margin: EdgeInsets.only(top: 20, left: 16, right: 16),
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              itemCount: wLocales.length,
              itemBuilder: (context, index) {
                return wLocales[index];
              },
            )),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
          Navigator.of(context).pushNamed('/ingresoLocal', arguments: 
          buscar.text);
        }));
  }
}

// ignore: must_be_immutable
class LocalCard extends StatefulWidget {
  Local aux;
  LocalCard(Local local) {
    aux = local;
  }

  @override
  _LocalCardState createState() => _LocalCardState();
}

class _LocalCardState extends State<LocalCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.aux.nombreLocal,
                style: TextStyle(fontSize: 25),
              ),
              subtitle: Text('Línea comercial: ' + widget.aux.lineaComercial),
            ),
            Container(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      color: Color(0x00F2F2F2),
                      elevation: 0,
                      splashColor: Color(0x00F2F2F2),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/localOnly', arguments: widget.aux);
                      },
                      child: Text(
                        'Ver más...',
                        style: TextStyle(color: Color(0xFF0E8AC9)),
                      ),
                    )))
          ],
        ));
  }
}
