import 'package:flutter/widgets.dart';
import 'package:google_maps/models/scan_model.dart';
import 'package:google_maps/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //asignar el id al nuevo scan
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {}
    this.scans.add(nuevoScan);
    notifyListeners();
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...?scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarScans() async {
    await DBProvider.db.deleteAll();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
  }
}
