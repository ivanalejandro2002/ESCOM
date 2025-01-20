import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';
import 'package:gestor/presentation/widgets/shared/download_pdf_button.dart';

class IaPage extends StatelessWidget {
  const IaPage({super.key});

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
                Text("Ingeniería en Inteligencia Artificial (2020)",textAlign:TextAlign.center, style:TextStyle(color:colors.onSecondary, fontSize: 30, fontWeight: FontWeight.w700)),
                Center(child: Text("Oferta Educativa",textAlign: TextAlign.center,style: TextStyle(color: colors.onPrimary, fontSize: 15,fontWeight: FontWeight.w500),)),
                SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child:ListView(
              children: [
                SizedBox(height: 10),
                DialogBox(title: "Objetivo", description: "Formar expertos capaces de desarrollar sistemas inteligentes utilizando diferentes metodologías en las diferentes etapas de desarrollo y aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados para atender las necesidades de los diferentes sectores de la sociedad a través de la generación de procesos y soluciones innovadoras."),
                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Ingreso", description: "Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN."),

                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Egreso", description: "El egresado de la Ingeniería en Inteligencia Artificial se desempeñará colaborativamente en equipos multidisciplinarios en el análisis, diseño, implementación, validación, implantación, supervisión y gestión de sistemas inteligentes, aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados; ejerciendo su profesión con liderazgo, ética y responsabilidad social."),

                SizedBox(height: 10,),
                DialogBox(title: "Campo Laboral", description: "Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:\n\n1.MEDICINA PERSONALIZADA: Procesos en el ámbito médico tales como el pre diagnóstico , análisis de imágenes médicas, análisis de historiales clínicos.\n\n2.ASISTENCIA Y MOVILIDAD PARA PERSONAS CON DISCAPACIDAD O DE LA TERCERA EDAD: Recursos que faciliten la movilidad y el acceso a servicios a través de diferentes medios, como: sillas de ruedas autónomas, guías inteligentes, traductores automáticos, generadores de texto, software de terapia y de acompañamiento.\n\n3.CIUDADES INTELIGENTES Y SOSTENIBLES: Sistemas inteligentes para mejorar la calidad de vida aplicados al transporte autónomo, identificación biométrica, detección de fraude, prevención y detección de accidentes, tutores inteligentes, control de tráfico vehicular, monitoreo y alertamiento ambiental, protección civil."),

                SizedBox(height: 10,),
                DialogBox(title: "Mapa Curricular", description: ""),
                SizedBox(height: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:Image.network("https://i.ibb.co/fv6jd2n/mapa-Curricular-IIA2020-areas.jpg",
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
                
                DownloadPdfButton(name: "https://drive.google.com/file/d/13CUAmQXf7v0V5pqzWKgUFHbDp_jMOoiQ/view?usp=sharing", career: "IA", buttonText: "Mapa Curricular",header: "mapa_curricular_"),
                SizedBox(height: 10,),
                DownloadPdfButton(name: "https://drive.google.com/file/d/1o9FM5N0OFd_mrFJkJ-geMdZW6UaOsY6D/view?usp=sharing", career: "IA", buttonText: "UA Optativas",header: "optativas_"),

                SizedBox(height: 10),
                DialogBox(title: "Titulación", description: "En la Escuela Superior de Cómputo, de conformidad con el Reglamento de Titulación Profesional vigente se considerarán 9 opciones para titulación profesional en la carrera de Ing. en Sistemas Computacionales (ISC), Ing. en Inteligencia Artificial (IIA), Lic. en Ciencia de Datos (LCD) e Ing. en Sistemas Automotrices (ISISA), debiendo cumplir cada una de ellas con requisitos y actividades propios:\n\n1.Proyecto de investigación\n2.Tesis\n3.Memoria de experiencia profesional\n4.Examen de conocimiento por áreas\n5.Créditos de posgrado\n6.Seminario de titulación\n7.Escolaridad\n8.Curricular\n9.Práctica profesional"),
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