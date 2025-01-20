import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UbicationScreen extends StatelessWidget {
  const UbicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    //--------Esto se saca al widget de mapa

    final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

    const CameraPosition _escom = CameraPosition(
      target: LatLng(19.5046493, -99.1488979),
      zoom: 14.4746
    );

    //----------------



    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: DrawerMenu(),

      body: Column(
        children: [
          Center(child: DialogBox(title: "Visítanos", description: "")),
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: InteractiveViewer(
                maxScale: 5,
                minScale: 1,
                child: Image(image: AssetImage("lib/assets/mapa.png")),
              ),
            ),
          ),

          DialogBox(title: "Dirección", description: "Av. Juan de Dios Batiz casi esquina Miguel Othón de Mendizabal.\nU.P. Adolfo López MAteos, C.P. 12345\nAlcaldía Gustavo A. Madero\nTeléfono: 55 5729 6000 Ext. 52001\nCorreo: escom@ipn.mx")
        ],
      ),

      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}