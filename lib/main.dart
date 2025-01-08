import 'package:flutter/material.dart';
import 'package:gestor/config/theme/app_theme.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/screens/login_page.dart';
import 'package:gestor/presentation/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

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
      
        home: LoginPage()
      ),
    );
  }
}