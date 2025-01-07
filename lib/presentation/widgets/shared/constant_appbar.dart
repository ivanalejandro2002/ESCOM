import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ConstantAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ConstantAppbar({super.key});

  @override

  Widget build(BuildContext context) {
    final chatProvider = context.watch<UserProvider>();
    final colors = Theme.of(context).colorScheme;

    return AppBar(
        backgroundColor: colors.primary,
        title: Text('ESCOM',style: TextStyle(color: colors.onPrimary)),
        centerTitle: true,
        leading: Builder(
          builder:(context) {
            return IconButton(
              icon: Icon(Icons.menu,color:colors.onPrimary),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              }, 
            );
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundColor: colors.onPrimary,
              backgroundImage: NetworkImage(chatProvider.globalUserData.imageUrl),
            ),
          ),
          
        ]
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}