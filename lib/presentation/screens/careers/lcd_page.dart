import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';

class LcdPage extends StatelessWidget {
  const LcdPage({super.key});

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
                Text("Licenciatura en Ciencia de Datos (2020)",textAlign:TextAlign.center, style:TextStyle(color:colors.onSecondary, fontSize: 30, fontWeight: FontWeight.w700)),
                Center(child: Text("Oferta Educativa",textAlign: TextAlign.center,style: TextStyle(color: colors.onPrimary, fontSize: 15,fontWeight: FontWeight.w500),)),
                SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child:ListView(
              children: [
                const SizedBox(height: 10),
                const DialogBox(title: "Objetivo", description: "Formar expertos capaces de extraer conocimiento implícito y complejo, potencialmente útil a partir de grandes conjuntos de datos, utilizando métodos de inteligencia artificial, aprendizaje de máquina, estadística, sistemas de bases de datos y modelos matemáticos sobre comportamientos probables, para apoyar la toma de decisiones de alta dirección."),
                const SizedBox(height: 10,),
                const DialogBox(title: "Perfil de Ingreso", description: "Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN."),

                const SizedBox(height: 10,),
                const DialogBox(title: "Perfil de Egreso", description: "El egresado de la Licenciatura de Ciencia de Datos será capaz de extraer conocimiento implícito y complejo, potencialmente útil (descubrimiento de patrones, desviaciones, anomalías, valores anómalos, situaciones interesantes, tendencias), a partir de grandes conjuntos de datos. Utiliza los métodos de la inteligencia artificial, aprendizaje de máquina, estadística y sistemas de bases de datos para la toma de decisiones de alta dirección, fundadas en los datos y modelos matemáticos sobre comportamientos probables, deseables e indeseables, participando en dinámicas de trabajo colaborativo e interdisciplinario con sentido ético y responsabilidad social."),

                const SizedBox(height: 10,),
                const DialogBox(title: "Campo Laboral", description: "El campo profesional en el que se desarrollan los egresados de este Programa Académico es muy amplio, se localiza en los sectores público y privado; en consultorías, en empresas del sector financiero, comercial, de servicios o bien en aquellas dedicadas a la innovación, en entidades federales, estatales, así como pequeño empresario creando empresas emergentes (startups)."),

                const SizedBox(height: 10,),
                const DialogBox(title: "Mapa Curricular", description: ""),
                const SizedBox(height: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:Image.network("https://i.ibb.co/jrhjqpM/mapa-Curricular-LCD2020-480.jpg",
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
                const SizedBox(height: 10,),
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

                const SizedBox(height: 10,),
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



                const SizedBox(height: 10),
                const DialogBox(title: "Titulación", description: "En la Escuela Superior de Cómputo, de conformidad con el Reglamento de Titulación Profesional vigente se considerarán 9 opciones para titulación profesional en la carrera de Ing. en Sistemas Computacionales (ISC), Ing. en Inteligencia Artificial (IIA), Lic. en Ciencia de Datos (LCD) e Ing. en Sistemas Automotrices (ISISA), debiendo cumplir cada una de ellas con requisitos y actividades propios:\n\n1.Proyecto de investigación\n2.Tesis\n3.Memoria de experiencia profesional\n4.Examen de conocimiento por áreas\n5.Créditos de posgrado\n6.Seminario de titulación\n7.Escolaridad\n8.Curricular\n9.Práctica profesional"),
                const SizedBox(height: 10,),


              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: const ConstantBottomBar(),
    );
  }
}