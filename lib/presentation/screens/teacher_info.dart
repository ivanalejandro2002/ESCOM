import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/drawer_menu.dart';

class TeacherInfo extends StatelessWidget {
  
  final Teachers currentData;
  const TeacherInfo({
    super.key,
    required this.currentData
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: DrawerMenu(),

      body: Column(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                currentData.myImage,
                height: 200,
                width: 280
              )
            ),
          ),
          Text(currentData.name,style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.w700),),
          Text('Cubiculo (Sala): ${currentData.office}'),
          Text('Contacto: ${currentData.contact}'),
          Text('Horario de clases:'),
        ],
      ),

      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}