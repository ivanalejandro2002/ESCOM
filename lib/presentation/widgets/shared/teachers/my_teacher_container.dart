import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/screens/teacher_info.dart';

class MyTeacherContainer extends StatelessWidget {
  final AssignedTeacher teacherData;
  const MyTeacherContainer({super.key, required this.teacherData});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final dimentions = MediaQuery.sizeOf(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TeacherInfo(
                        teacherId: teacherData.teacherID,
                        firstName: teacherData.firstName, // Nombre del profesor
                        academyName: teacherData.academyName, // Academia
                        curp: teacherData.curp)));
          },
          child: Container(
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 75,
              width: (dimentions.width - 10),
              child: Column(
                children: [
                  Text(teacherData.firstName,
                      style: TextStyle(color: colors.onPrimary, fontSize: 20)),
                  Text('Cargo: ${teacherData.academyName}',
                      style: TextStyle(
                        color: colors.onPrimary,
                        fontSize: 15,
                      ))
                ],
              )),
        ),
        SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
