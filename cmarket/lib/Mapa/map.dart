import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => new _MapaState();
}

class _MapaState extends State<Mapa> {
  bool mapToggle = false;
  bool sitiosToggle = false;
  var currentLocation;
  var aux;
  String text = "";
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    Geolocator().getCurrentPosition().then((currLoc) {
      currentLocation = currLoc;
      mapToggle = true;
    });
    populateClients();
    super.initState();
  }

  onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  populateClients() {
    Firestore.instance.collection('markers').getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; ++i) {
          initMarkers(docs.documents[i].data, docs.documents[i].documentID);
        }
      }
    });
  }

  void initMarkers(request, requestID) {
    sitiosToggle = true;
    var markerIdVal = requestID;
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(request['lat'], request['lng']),
        draggable: true,
        onTap: () {
          getValues(request);
        },
        infoWindow:
            InfoWindow(title: "Barrio: ", snippet: request['nombreBarrio']));
    setState(() {
      markers[markerId] = marker;
      print(markerId);
    });
  }

  void getValues(request) {
    setState(() {
      text = request['nombreBarrio'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height - 150.0,
                  width: double.infinity,
                  child: mapToggle
                      ? GoogleMap(
                          markers: Set<Marker>.of(markers.values),
                          onMapCreated: onMapCreated,
                          myLocationEnabled: true,
                          compassEnabled: true,
                          zoomGesturesEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(currentLocation.latitude,
                                currentLocation.longitude),
                            zoom: 14.0,
                          ),
                          mapType: MapType.normal)
                      : Center(
                          child: Text('Cargando...',
                              style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF0E8AC9))),
                        )),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: EdgeInsets.only(
                      left: 10.0,
                      top: (MediaQuery.of(context).size.height) / 10),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 25.0),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                    left: 10.0, top: (MediaQuery.of(context).size.height) / 10),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Color(0xFF0E8AC9),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: Container(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'Buscar Catálogo',
                          style: TextStyle(color: Color(0xFFF9F9F9)),
                        ))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
