import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition puntoInicial = CameraPosition(
      target: LatLng(-12.097370529305818, -77.00735415150533),
      zoom: 17,
      tilt: 50,
    );

    //marcadores
    Set<Marker> marcadores = new Set<Marker>();
    marcadores.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: LatLng(-12.0969587266772, -77.03621727335025),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_disabled),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(-12.097370529305818, -77.00735415150533),
                  zoom: 17,
                  tilt: 50,
                ),
              ));
            },
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        markers: marcadores,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
