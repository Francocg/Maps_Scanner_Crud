import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_maps/providers/scan_list_provider.dart';
import 'package:google_maps/utils/utils.dart';
import 'package:provider/provider.dart';
//Boton para hacer el scanner
class  ScanBotton extends StatelessWidget {
//Para esacner el codigo QR
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async{
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666',  'Cancelar',  false, ScanMode.QR); 
     //final barcodeScanRes = 'geo:-12.0969587266772, -77.03621727335025';
     if(barcodeScanRes == '-1'){
       return;
     }
     
     
     final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
     final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

     
     launcherURL(context, nuevoScan);
     
      },
     
      
    );
  }
}