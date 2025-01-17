import 'package:flutter/material.dart';
import 'package:gestor/config/theme/app_theme.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/screens/login_page.dart';
import 'package:gestor/presentation/screens/main_page.dart';
import 'package:gestor/presentation/screens/my_professors_view.dart';
import 'package:gestor/presentation/screens/teacher_info.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: MaterialApp(
            title: 'ESCOM',
            debugShowCheckedModeBanner: false,
            theme: AppTheme(selectedColor: 6).theme(),
            routes: {
              '/login': (context) => const LoginPage(),
              '/my_professors': (context) => const MyProfessorsView(),
            },
            home: TeacherInfo(
              academyName: "Papas",
              curp: "Miaustigmatismo",
              firstName: "Pepe",
              teacherId: "ID = XD",
            )));
  }
}
