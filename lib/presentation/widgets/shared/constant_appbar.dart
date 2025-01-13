import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ConstantAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ConstantAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final colors = Theme.of(context).colorScheme;

    return AppBar(
        backgroundColor: colors.primary,
        title: Text('ESCOM', style: TextStyle(color: colors.onPrimary)),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: colors.onPrimary),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
              icon: Icon(Icons.account_circle, color: colors.onPrimary),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
