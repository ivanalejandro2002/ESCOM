import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/teachers.dart';

class MyTeacherContainer extends StatelessWidget {
  final AsignedTeacher teacherData;
  const MyTeacherContainer({
    super.key,
    required this.teacherData
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final dimentions = MediaQuery.sizeOf(context);
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            //TODO: LLamar a la pantalla del maestro
          },
          child: Container(
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 75,
            width: (dimentions.width-10),
            
            child: Column(
              children: [
                Text(teacherData.name,style: TextStyle(color: colors.onPrimary, fontSize: 20)),
                Text('Cargo: ${teacherData.position}', style: TextStyle(color: colors.onPrimary, fontSize: 15,)),
                Text('Contacto: ${teacherData.contact}', style: TextStyle(color: colors.onPrimary, fontSize: 15)),
              ],
            )
          ),
        ),
        SizedBox(height: 3,),
      ],
    );
  }
}