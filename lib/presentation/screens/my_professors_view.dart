import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/teachers/my_teacher_container.dart';
import 'package:provider/provider.dart';

class MyProfessorsView extends StatelessWidget {
  const MyProfessorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Directorio', style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.w700)),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: userProvider.globalUserData.subjects.length,
              itemBuilder: (context,index){
                return MyTeacherContainer(teacherData: userProvider.globalUserData.subjects[index]);
              },
            )
          )
        ],
      ),
      bottomNavigationBar: ConstantBottomBar(),
    );
  }
}