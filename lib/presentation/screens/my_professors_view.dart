import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/api_provider.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/teachers/my_teacher_container.dart';
import 'package:provider/provider.dart';

class MyProfessorsView extends StatefulWidget {
  const MyProfessorsView({super.key});

  @override
  _MyProfessorsViewState createState() => _MyProfessorsViewState();
}

class _MyProfessorsViewState extends State<MyProfessorsView> {
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchTeachers(); // Llama a la función antes de construir el widget
  }

  Future<void> _fetchTeachers() async {
    try {
      final teacher_list = await ApiService.getTeachers();
      final userProvider = context.read<UserProvider>();
    } catch (e) {
      setState(() {
        _error = 'Error al cargar la lista de maestros: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: ConstantAppbar(),
        drawer: const DrawerMenu(),
        body: Center(
          child: Text(_error!, style: const TextStyle(color: Colors.red)),
        ),
        bottomNavigationBar: const ConstantBottomBar(),
      );
    }

    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Directorio',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userProvider.globalUserData.subjects.length,
              itemBuilder: (context, index) {
                return MyTeacherContainer(
                  teacherData: userProvider.globalUserData.subjects[index],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ConstantBottomBar(),
    );
  }
}
