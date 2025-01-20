import 'package:flutter/material.dart';
import 'package:gestor/config/theme/app_theme.dart';
import 'package:gestor/config/theme/new_app_theme.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/screens/careers/ISC_page.dart';
import 'package:gestor/presentation/screens/careers/career_page.dart';
import 'package:gestor/presentation/screens/careers/ia_page.dart';
import 'package:gestor/presentation/screens/careers/lcd_page.dart';
import 'package:gestor/presentation/screens/careers/mc_iacd_page.dart';
import 'package:gestor/presentation/screens/careers/mc_isc_page.dart';
import 'package:gestor/presentation/screens/careers/ubication_screen.dart';
import 'package:gestor/presentation/screens/login_page.dart';
import 'package:gestor/presentation/screens/home.dart';
import 'package:gestor/presentation/screens/teachers_list.dart';
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
            //theme: AppTheme(selectedColor: 3).theme(),
            theme: lightThemeData(context),
            routes: {
              '/login': (context) => const LoginPage(),
              '/my_professors': (context) => const TeachersList(),
            },
            home: const McIacdPage()));
  }
}
