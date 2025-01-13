import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/domain/entities/teachers.dart';
import 'package:gestor/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final ValueChanged<GlobalUser> onValue;
  const LoginForm({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(

              decoration: const InputDecoration(
                hintText: 'Ingrese número de boleta',
                labelText: 'Boleta',
                border: OutlineInputBorder()
              ),

              validator: (value){
                if(value== null || value.isEmpty){
                  return 'Agrega un número de boleta';
                }

                bool onlyNumbers = RegExp(r'^[0-9]+$').hasMatch(value);

                if(!onlyNumbers){
                  return 'El número de boleta debe ser numerico';
                }

                if(value.length != 10){
                  return 'El número de boleta consta de 10 dígitos';
                }
                return null;
              }
            ),
          ),

          const SizedBox(height: 15,),

          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(

              decoration: const InputDecoration(
                hintText: 'Ingrese su CURP',
                labelText: 'CURP',
                border: OutlineInputBorder()
              ),

              validator: (value){
                if(value== null || value.isEmpty){
                  return 'Agrega una CURP';
                }
                
                bool correctCurp = RegExp(r'^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$').hasMatch(value);
                if(!correctCurp){
                  return 'Coloca una CURP real';
                }
                return null;
              }
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Procesando Datos'))
                  );
                  
                  //TODO: Agregar la consulta de la base de datos


                  //Esta es una interacción de prueba, pero puede basarse para más facilidad
                  //El objeto de retorno de la base de datos debe convertirse en uno de tipo GlobalUser

                  //Para las materias se construye con la clase Asigned Teacher convirtiendola en una lista
                  GlobalUser random = GlobalUser(
                    nombre: 'Panchito',
                    imageUrl: 'https://static.wikia.nocookie.net/mamarre-estudios-espanol/images/5/54/CUVcOWP4.jpg/revision/latest/thumbnail/width/360/height/360?cb=20201009210428&path-prefix=es',
                    boleta: '123456',
                    curp: 'ABCDario',
                    subjects: [
                      AsignedTeacher(id: '8',name: 'a', position: 'b', contact: 'c', deparment: 'd', group: 'e', subject: 'f')
                    ]
                  );


                  onValue(random);
                }
              }, 
              child: const Text('Enviar'),
            ),
          ),

        ],
      )
    );
  }
}