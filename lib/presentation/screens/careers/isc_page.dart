import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';

class IscPage extends StatelessWidget {
  const IscPage({super.key});

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
                Text("Ingeniería en Sistemas Computacionales (2020)",textAlign:TextAlign.center, style:TextStyle(color:colors.onSecondary, fontSize: 30, fontWeight: FontWeight.w700)),
                Center(child: Text("Oferta Educativa",textAlign: TextAlign.center,style: TextStyle(color: colors.onPrimary, fontSize: 15,fontWeight: FontWeight.w500),)),
                SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child:ListView(
              children: [
                SizedBox(height: 10),
                DialogBox(title: "Objetivo", description: "Formar ingenieros en sistemas computacionales de sólida preparación científica y tecnológica en los ámbitos del desarrollo de software y hardware, que propongan, analicen, diseñen, desarrollen, implementen y gestionen sistemas computacionales a partir de tecnologías de vanguardia y metodologías, normas y estándares nacionales e internacionales de calidad; líderes de equipos de trabajo multidisciplinarios y multiculturales, con un alto sentido ético y de responsabilidad."),
                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Ingreso", description: "Los aspirantes a estudiar este programa deberán tener conocimientos en matemáticas, física e informática. Es también conveniente que posea conocimientos de inglés. Así mismo, deberán contar con habilidades como análisis y síntesis de información, razonamiento lógico y expresión oral y escrita. Así como actitudes de respeto y responsabilidad."),

                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Egreso", description: "El egresado del programa académico de Ingeniería en Sistemas Computacionales podrá desempeñarse en equipos multidisciplinarios e interdisciplinarios en los ámbitos del desarrollo de software y hardware, sustentando su actuación profesional en valores éticos y de responsabilidad social, con un enfoque de liderazgo y sostenibilidad en los sectores público y privado."),

                SizedBox(height: 10,),
                DialogBox(title: "Atributos del Egresado", description: "Los atributos de egreso son un conjunto de resultados evaluables individualmente, que conforman los componentes indicativos del potencial de un egresado para adquirir las competencias o capacidades para ejercer la práctica de la ingeniería a un nivel apropiado.\n\n1.Modelar problemas en sistemas computacionales a partir de conocimientos de ciencias básicas e ingeniería\n  2.Resolver problemas en sistemas computacionales, con base en la metodología de desarrollo, análisis de resultados y toma de decisiones\n  3.Desarrollar sistemas computacionales de acuerdo a procesos de diseño, estándares de calidad y optimización de procesos\n  4.Integrar habilidades de liderazgo, comunicación efectiva y trabajo colaborativo para la planificación de tareas, cumplimiento de metas y análisis de riesgos\n  5.Asumir una actitud ética y crítica en su desempeño académico que considere su impacto económico, social y ambiental y que reconozca sus necesidades de actualización permanente"),

                SizedBox(height: 10,),
                DialogBox(title: "Campo Laboral", description: "El campo profesional en el que se desarrollan los egresados de este Programa Académico es muy amplio, se localiza en los sectores público y privado; en consultorías, en empresas del sector financiero, comercial, de servicios o bien en aquellas dedicadas a la innovación, en entidades federales, estatales, así como pequeño empresario creando empresas emergentes (startups)."),

                SizedBox(height: 10,),
                DialogBox(title: "Mapa Curricular", description: ""),
                SizedBox(height: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:Image.network("https://website-assets.studocu.com/img/document_thumbnails/6205fe66b5ec15f32673b846698382fe/thumb_300_200.png",
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
                DialogBox(title: "Titulación", description: "En la Escuela Superior de Cómputo, de conformidad con el Reglamento de Titulación Profesional vigente se considerarán 9 opciones para titulación profesional en la carrera de Ing. en Sistemas Computacionales (ISC), Ing. en Inteligencia Artificial (IIA), Lic. en Ciencia de Datos (LCD) e Ing. en Sistemas Automotrices (ISISA), debiendo cumplir cada una de ellas con requisitos y actividades propios:\n\n1.Proyecto de investigación\n2.Tesis\n3.Memoria de experiencia profesional\n4.Examen de conocimiento por áreas\n5.Créditos de posgrado\n6.Seminario de titulación\n7.Escolaridad\n8.Curricular\n9.Práctica profesional"),
                SizedBox(height: 10,),

                DialogBox(title: "Objetivos Educacionales", description: "Formar Ingenieros en Sistemas Computacionales que cuenten con una sólida formación integral que les permita proponer, analizar, diseñar, desarrollar, implementar, gestionar y administrar sistemas computacionales usando tecnologías de vanguardia y aplicando metodologías, normas y estándares nacionales e internacionales de calidad, con el propósito de crear, mejorar y sistematizar procesos administrativos e industriales en el área computacional. Integrar y administrar equipos de trabajo inter y multidisciplinarios, así como multiculturales, con actitud de liderazgo, ética y responsabilidad. Actualizándose permanentemente para responder a las necesidades de la sociedad y al desarrollo sustentable de la nación."),
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