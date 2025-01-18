import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.primary,
            ),
            child: Text('Menú'),
          ),
          ListTile(
            title: const Text('UNO'),
            onTap: (){

            }
          ),
          ListTile(
            title: const Text('DOS'),
            onTap: (){

            }
          ),
          ListTile(
            title: const Text('TRES'),
            onTap: (){

            }
          )
        ],
      )
    );
  }
}