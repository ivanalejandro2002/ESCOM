import 'package:flutter/material.dart';
import 'package:gestor/config/theme/app_theme.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/screens/login_page.dart';
import 'package:gestor/presentation/screens/main_page.dart';
import 'package:gestor/presentation/screens/my_professors_view.dart';
import 'package:gestor/presentation/screens/teacher_info.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());


//--Este es el horario de ejemplo
final List<Map<String, dynamic>> schedule = [
    {
      "GroupCode": "G101",
      "UnitName": "Mathematics",
      "DayOfWeek": "Lunes",
      "StartTime": "8:30",
      "EndTime": "10:00",
      "Classroom": "Room 101",
      "Lab": null,
    },
    {
      "GroupCode": "G101",
      "UnitName": "Mathematics",
      "DayOfWeek": "Viernes",
      "StartTime": "8:30",
      "EndTime": "10:00",
      "Classroom": "Room 101",
      "Lab": null,
    },
    {
      "GroupCode": "G101",
      "UnitName": "Mathematics",
      "DayOfWeek": "Martes",
      "StartTime": "8:30",
      "EndTime": "10:00",
      "Classroom": "Room 101",
      "Lab": null,
    },
    {
      "GroupCode": "G101",
      "UnitName": "Mathematics",
      "DayOfWeek": "Miercoles",
      "StartTime": "8:30",
      "EndTime": "10:00",
      "Classroom": "Room 101",
      "Lab": null,
    },
    {
      "GroupCode": "G201",
      "UnitName": "Physics",
      "DayOfWeek": "Jueves",
      "StartTime": "10:30",
      "EndTime": "12:00",
      "Classroom": "Room 202",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "G203",
      "UnitName": "Formulación y Evaluación de Proyectos Informáticos",
      "DayOfWeek": "Viernes",
      "StartTime": "10:30",
      "EndTime": "12:00",
      "Classroom": "Room 202",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "G205",
      "UnitName": "Comedia",
      "DayOfWeek": "Martes",
      "StartTime": "7:00",
      "EndTime": "8:30",
      "Classroom": "Room 202",
      "Lab": "Lab A",
    },
    {
      "GroupCode": "G205",
      "UnitName": "Relleno",
      "DayOfWeek": "Miercoles",
      "StartTime": "16:30",
      "EndTime": "18:00",
      "Classroom": "Room 202",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "G205",
      "UnitName": "Relleno",
      "DayOfWeek": "Miercoles",
      "StartTime": "16:30",
      "EndTime": "18:00",
      "Classroom": "Room 202",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "G205",
      "UnitName": "Relleno",
      "DayOfWeek": "Lunes",
      "StartTime": "13:30",
      "EndTime": "15:00",
      "Classroom": "Room 202",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "6CM2",
      "UnitName": "La clase del Lorem IPSUM",
      "DayOfWeek": "Jueves",
      "StartTime": "20:00",
      "EndTime": "21:30",
      "Classroom": "2105",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "6CM2",
      "UnitName": "La clase del Lorem IPSUM",
      "DayOfWeek": "Martes",
      "StartTime": "16:30",
      "EndTime": "20:00",
      "Classroom": "2105",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "6CM2",
      "UnitName": "La clase del Lorem IPSUM",
      "DayOfWeek": "Miercoles",
      "StartTime": "16:30",
      "EndTime": "20:00",
      "Classroom": "2105",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "6CM1",
      "UnitName": "Una clase random",
      "DayOfWeek": "Viernes",
      "StartTime": "10:30",
      "EndTime": "12:00",
      "Classroom": "2105",
      "Lab": "Lab A",
    },
    {
      "GroupCode": "6CM1",
      "UnitName": "Una clase random",
      "DayOfWeek": "Jueves",
      "StartTime": "12:00",
      "EndTime": "13:30",
      "Classroom": "2105",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "6CM1",
      "UnitName": "Madrugadora",
      "DayOfWeek": "Martes",
      "StartTime": "20:00",
      "EndTime": "21:30",
      "Classroom": "2105",
      "Lab": "Lab A",
    },
    {
      "GroupCode": "6CM1",
      "UnitName": "Madrugadora",
      "DayOfWeek": "Miercoles",
      "StartTime": "7:00",
      "EndTime": "8:30",
      "Classroom": "2105",
      "Lab": "Lab A",
    },

    {
      "GroupCode": "6CM1",
      "UnitName": "Madrugadora",
      "DayOfWeek": "Jueves",
      "StartTime": "18:30",
      "EndTime": "20:00",
      "Classroom": "2105",
      "Lab": "Lab A",
    },
    // Agregar más elementos si se necesita un horario más largo
  ];

//---------------------------------------------



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        title: 'ESCOM',
      
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
      
        home: TeacherInfo(
          currentData: Teachers(
            id: '1021210', 
            name: 'Pancheeto Perez', 
            position: 'Maestro', 
            contact: 'Tu corazón', 
            deparment: 'Escolar', 
            office: '4020', 
            myImage: 'https://cdn.milenio.com/uploads/media/2023/08/02/perrito-cheems-muere-instagram.jpg'
          ),
          schedule: schedule,
        )
      ),
    );
  }
}