import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DownloadPdfButton extends StatelessWidget {
  final String name;
  final String career;
  final String buttonText;
  final String header;
  const DownloadPdfButton({
    super.key,
    required this.name,
    required this.career,
    required this.buttonText,
    required this.header
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    void downloadFile(final String name, final String carrera, final String cabecera) async{
      try{
        var path = "/storage/emulated/0/Download/$cabecera$carrera.pdf";

        var file = File(path);
        var res = await get(Uri.parse(name));
        file.writeAsBytes(res.bodyBytes);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Horario guardado en: $path')),
        );
      }catch(e){
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar la imagen')),
        );
      }
    }
    
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            downloadFile(name,career,header);
          },
          child: Container(
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), 
              color: colors.secondary
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.download,color: colors.onSecondary,),
                Text(buttonText,style: TextStyle(color: colors.onSecondary,fontSize: 20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}