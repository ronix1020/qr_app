import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner/pages/widgets/scan_button.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiprovider = Provider.of<UiProvider>(context);

    final currentIndex = uiprovider.selectedMenuOpt;

    // TODO: Temporal leer la base de datos
    // final tempScan = new ScanModel(valor: 'http://www.google.com');
    // DBProvider.db.getScanByID(3).then((scan) => print(scan.valor));
    DBProvider.db.getTodosLosScans().then(print);

    switch (currentIndex) {
      case 0:
        return MapasPage();

      case 1:
        return DireccionesPage();

      default:
        MapasPage();
    }
  }
}
