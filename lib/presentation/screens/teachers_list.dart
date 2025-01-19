import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/domain/testconstants/test_schedule.dart';
import 'package:gestor/presentation/screens/teacher_info.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/teachers/my_teacher_container.dart';

class TeachersList extends StatefulWidget {
  const TeachersList({super.key});

  @override
  _TeachersListState createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  final bool _isLoading = false;
  String? _error;

  /* Aquí llamar para obtener lista */
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final userProvider = context.watch<UserProvider>();
    final GlobalUser userProvider = test_user_data;
    final colors = Theme.of(context).colorScheme;
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
                        onPressed: () => print(userProvider),
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
                      color: colors.tertiaryFixed,
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
                        itemCount: userProvider.subjects.length,
                        itemBuilder: (context, index) {
                          final teacher = userProvider.subjects[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: colors.secondary,
                                child: Text(teacher.firstName[0]),
                              ),
                              title: Text(teacher.firstName),
                              subtitle: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Departamento - ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: teacher.academyName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward),
                              onTap: () {
                                // Acción que debe ocurrir cuando el ListTile es tocado
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TeacherInfo(
                                      teacherId: teacher.teacherID,
                                      firstName: teacher.firstName,
                                      academyName: teacher.academyName,
                                      curp: teacher.curp,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: colors.tertiary,
                          thickness: 2,
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
