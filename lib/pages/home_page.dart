import 'package:flutter/material.dart';
import 'package:google_maps/pages/direciones_page.dart';
import 'package:google_maps/pages/mapas_page.dart';
import 'package:google_maps/providers/db_provider.dart';
import 'package:google_maps/providers/scan_list_provider.dart';
import 'package:google_maps/providers/ui_provider.dart';
import 'package:google_maps/widgets/custom_navigatorbar.dart';
import 'package:google_maps/widgets/sacn_botton.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text('Historial'), actions: [
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            Provider.of<ScanListProvider>(context, listen: false).borrarScans();
          },
        )
      ]),
      body: _HomePageBody(),
      //aqui se aplica el custom navigator bar
      bottomNavigationBar: CustomNavigatorBar(),
      //aqui se aplica el scan botton
      floatingActionButton: ScanBotton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selector de menu
    final uiProvider = Provider.of<UiProvider>(context);

    //Para mostrar las paginas
    final currentIndex = uiProvider.selectedMenuOpt;

    //usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
