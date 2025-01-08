import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/login_form.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: ConstantAppbar(),

      drawer: DrawerMenu(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('ESCOMUNIDAD',style: const TextStyle(color: Colors.blue,fontSize: 30))),

          LoginForm(
            onValue: (value) => userProvider.newLogin(value),
          ),
        ],
      ),

      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}