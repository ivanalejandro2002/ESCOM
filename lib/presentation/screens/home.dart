import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/widgets/career_grid.dart';
import 'package:gestor/presentation/widgets/shared/carousel_photos.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<UserProvider>();

    return Scaffold(
      //Barra principal superior
      appBar: ConstantAppbar(),

      body: ListView(
        children: [
          CarouselPhotos(),
          const DialogBox(
              title: 'Bienvenido',
              description:
                  'La ESCOM te ofrece una educación de calidad en las áreas de sistemas computacionales, inteligencia artificial y ciencia de datos. Prepárate para enfrentar los desafíos del futuro y desarrollar soluciones tecnológicas que impacten positivamente a la sociedad.'),
          const SizedBox(height: 10),
          CareerGrid()
        ],
      ),

      drawer: DrawerMenu(),

      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}
