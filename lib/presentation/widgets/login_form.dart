import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/services/api_service.dart';
import 'package:gestor/presentation/screens/teachers_list.dart';
import 'package:gestor/services/session_manager.dart';

class LoginForm extends StatefulWidget {
  final ValueChanged<GlobalUser> onValue;

  const LoginForm({
    super.key,
    required this.onValue,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String boleta = '';
  String curp = '';

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Procesando Datos...')),
      );

      try {
        final successfulLogin = await ApiService.login(boleta, curp);
        if (successfulLogin) {
          final sessionManager = SessionManager();
          sessionManager.saveSession("un token", boleta);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('¡Login exitoso!')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeachersList(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Credenciales inválidas')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Número de Boleta',
                hintText: 'Ingrese número de boleta',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
              onChanged: (value) => boleta = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu número de boleta';
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'La boleta debe contener solo números';
                }
                /*if (value.length != 10) {
                  return 'La boleta debe tener exactamente 10 dígitos';
                }*/
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'CURP',
                hintText: 'Ingrese su CURP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.lock),
              ),
              onChanged: (value) => curp = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu CURP';
                }
                /*if (!RegExp(
                        r'^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$')
                    .hasMatch(value)) {
                  return 'Por favor ingresa un CURP válido';
                }*/
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: colors.primary,
              ),
              onPressed: _isLoading ? null : _handleLogin,
              child: _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(colors.tertiary),
                    )
                  : Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 18,color: colors.surface),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
