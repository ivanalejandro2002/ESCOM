import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';

class McIscPage extends StatelessWidget {
  const McIscPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const ConstantAppbar(),
      drawer: DrawerMenu(),
      body: Column(
        
        children: [
          Container(
            color: colors.tertiaryFixed,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("Maestría en Ciencias en Sistemas Computacionales (2020)",textAlign:TextAlign.center, style:TextStyle(color:colors.onSecondary, fontSize: 30, fontWeight: FontWeight.w700)),
                Center(child: Text("Oferta Educativa",textAlign: TextAlign.center,style: TextStyle(color: colors.onPrimary, fontSize: 15,fontWeight: FontWeight.w500),)),
                SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child:ListView(
              children: [
                SizedBox(height: 10),
                DialogBox(title: "Objetivos", description: "Formar maestros en ciencias con una orientación científica altamente calificados y competitivos a nivel nacional e internacional, con la capacidad de contribuir y realizar investigación en las ciencias computacionales móviles.\n\nInnovar, implementar y aplicar la computación móvil para atender adecuadamente las necesidades de los sectores productivo y social del país."),
                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Ingreso", description: "1. Poseer título profesional o certificado oficial de terminación de estudios en el área de Ingeniería en Sistemas Computacionales, Telecomunicaciones, Electrónica o Matemáticas.\n\n2. Aprobar el proceso de admisión de conformidad a lo establecido en el Reglamento de Estudios de Posgrado y lo acordado en el H. Colegio de Profesores de la SEPI-ESCOM.\n\n3. No haber causado baja en algún posgrado del IPN, salvo que haya sido revocada por el Colegio Académico de Posgrado.\n\n4. Es importante mencionar que, para el trámite de obtención de grado deberá presentar evidencia del dominio del idioma nivel B1 en mínimo dos habilidades."),

                SizedBox(height: 10,),
                DialogBox(title: "Mapa Curricular", description: ""),
                SizedBox(height: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:Image.network("https://i.ibb.co/KzM6k3y/mapa-curricular.png",
                      width: size.width *0.7,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  )
                ),


                //TODO: Agregar los botones de descarga
                SizedBox(height: 10,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        
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
                            Text('Mapa Curricular',style: TextStyle(color: colors.onSecondary,fontSize: 20)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 10,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){

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
                            Text('UA Optativas',style: TextStyle(color: colors.onSecondary,fontSize: 20)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),



                SizedBox(height: 10),
                DialogBox(title: "Titulación", description: "Para obtener el grado de Maestría, el alumno deberá cumplir con los requisitos establecidos en el Artículo 48 del Reglamento de Estudios de Posgrado del IPN vigente.\n\na) Estar inscrito en el programa de maestría correspondiente;\n\nb) Cumplir su programa individual de actividades definitivo;\n\nc) Haber desarrollado una tesis de maestría con las características señaladas en el reglamento, y\n\nd) Aprobar el examen de grado"),
                SizedBox(height: 10,),


              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: const ConstantBottomBar(),
    );
  }
}