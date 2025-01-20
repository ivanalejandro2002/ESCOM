import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/career_grid.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';

class CareerPage extends StatelessWidget {
  const CareerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: DrawerMenu(),
      body: Column(
        children: [
          DialogBox(title: "Carreras", description: "La Escuela Superior de Cómputo (ESCOM) tiene varias carreras las cuales se enlistan a continuación dentro de la oferta educativa:"),
          
          const SizedBox(height: 20,),

          CareerGrid(),

          const DialogBox(title: "Nota Especial",description: "Para conocer más detalles de las carreras haga clic en el ícono correspondiente a la carrera que desee obtener información"),


        ],
      ),

      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}