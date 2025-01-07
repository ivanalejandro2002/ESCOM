import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/widgets/shared/career_grid.dart';
import 'package:gestor/presentation/widgets/shared/carousel_photos.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';
import 'package:gestor/presentation/widgets/shared/drawer_menu.dart';
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

          const DialogBox(title: 'Hola', description: 'Do excepteur officia cupidatat consequat duis eu id aute commodo. Eiusmod elit ullamco consequat quis reprehenderit laboris aliquip nostrud anim aliqua. Consectetur ipsum incididunt sint qui duis laboris ullamco commodo. Et nulla non non reprehenderit. Dolore deserunt sit consequat veniam non. Eiusmod ut laborum id ut fugiat laboris occaecat dolor.'),

          const SizedBox(height: 10),
          CareerGrid()
        ],
      ),

      drawer: DrawerMenu(), 

      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}