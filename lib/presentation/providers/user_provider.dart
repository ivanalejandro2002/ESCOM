import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/global_user.dart';
import 'package:gestor/domain/entities/teachers.dart';

class UserProvider extends ChangeNotifier{
  
  int colorPalete = 0;


  GlobalUser globalUserData = GlobalUser(
    nombre: 'Pepito', 
    boleta: '1234567890', 
    curp: 'XD', 
    imageUrl: 'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg',
    subjects: [
      AsignedTeacher(
        name: 'Maestro Bot', 
        position: 'Profesor', 
        contact: '55123456789', 
        deparment: 'Electónica', 
        group: '5CM1', 
        subject: 'Procesamiento Digital de Señales'
      ),
      AsignedTeacher(
        name: 'Maestro 2', 
        position: 'Profesor chafa', 
        contact: '55123456789', 
        deparment: 'Mantenido', 
        group: 'XXX3', 
        subject: 'Mendigar'
      ),
      AsignedTeacher(
        name: 'Pepe', 
        position: 'Arriba', 
        contact: '55123456789', 
        deparment: 'Abajo', 
        group: '4AM2', 
        subject: 'No se sabe'
      ),
      AsignedTeacher(
        name: 'Otro maestro más', 
        position: 'maistro', 
        contact: '55123456789', 
        deparment: 'Sonidero', 
        group: '6CM7', 
        subject: 'Sistemas en Chip'
      ),
      AsignedTeacher(
        name: 'Maestro Bot', 
        position: 'Profesor', 
        contact: '55123456789', 
        deparment: 'Electónica', 
        group: '5CM1', 
        subject: 'Procesamiento Digital de Señales'
      ),
      AsignedTeacher(
        name: 'Maestro Bot', 
        position: 'Profesor', 
        contact: '55123456789', 
        deparment: 'Electónica', 
        group: '5CM1', 
        subject: 'Procesamiento Digital de Señales'
      ),
      AsignedTeacher(
        name: 'Maestro Bot', 
        position: 'Profesor', 
        contact: '55123456789', 
        deparment: 'Electónica', 
        group: '5CM1', 
        subject: 'Procesamiento Digital de Señales'
      ),
    ]
  );

  Future<void> addPhoto(String dir) async{
    globalUserData.imageUrl = dir;
    notifyListeners();
  }

  //Sirve para cambiar la paleta de colores
  Future<void> changePallete(int newPallete) async{
    colorPalete = newPallete;
    notifyListeners();
  }

  //Este sirve para poder obtener un nuevo usuario de la base de datos
  //Se llama una vez esté asegurado que el dato existe.
  Future<void> newLogin(GlobalUser newData) async{
    globalUserData = newData;
    notifyListeners();
  }

}