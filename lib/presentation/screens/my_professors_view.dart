import 'package:flutter/material.dart';
import 'package:gestor/presentation/providers/api_provider.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:gestor/presentation/screens/teacher_info.dart';
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
      // Obtén la lista de maestros desde el servicio API
      final teacherList = await ApiService.getTeachers();

      // Actualiza los datos en el UserProvider
      final userProvider = context.read<UserProvider>();
      userProvider.globalUserData = userProvider.globalUserData.copyWith(
        subjects: teacherList,
      );
    } catch (e) {
      // Manejo de errores
      setState(() {
        _error = 'Error al cargar la lista de maestros: $e';
      });
    } finally {
      // Indica que la carga ha finalizado
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: ConstantAppbar(),
      drawer: const DrawerMenu(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _error!,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _fetchTeachers,
                        child: const Text('Reintentar'),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Encabezado
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      color: Colors.blueAccent,
                      child: const Text(
                        'Directorio de Profesores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Lista de maestros
                    Expanded(
                      child: ListView.separated(
                        itemCount: userProvider.globalUserData.subjects.length,
                        itemBuilder: (context, index) {
                          final teacher =
                              userProvider.globalUserData.subjects[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: MyTeacherContainer(teacherData: teacher),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
      bottomNavigationBar: const ConstantBottomBar(),
    );
  }
}
