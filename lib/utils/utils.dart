import 'package:flutter/material.dart';
import 'package:google_maps/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launcherURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == 'http') {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir el url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
