import 'package:flutter/material.dart';
import 'package:google_maps/providers/scan_list_provider.dart';
import 'package:google_maps/widgets/scan_tiles.dart';
import 'package:provider/provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
