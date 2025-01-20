import 'package:flutter/material.dart';
import 'package:gestor/presentation/widgets/drawer_menu.dart';
import 'package:gestor/presentation/widgets/shared/constant_appbar.dart';
import 'package:gestor/presentation/widgets/shared/constant_bottom_bar.dart';
import 'package:gestor/presentation/widgets/shared/dialog_box.dart';
import 'package:gestor/presentation/widgets/shared/download_pdf_button.dart';

class McIacdPage extends StatelessWidget {
  const McIacdPage({super.key});

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
                Text("Maestría en Ciencia y Tecnología de Inteligencia Artificial y Ciencia de Datos",textAlign:TextAlign.center, style:TextStyle(color:colors.onSecondary, fontSize: 30, fontWeight: FontWeight.w700)),
                Center(child: Text("Oferta Educativa",textAlign: TextAlign.center,style: TextStyle(color: colors.onPrimary, fontSize: 15,fontWeight: FontWeight.w500),)),
                SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child:ListView(
              children: [
                SizedBox(height: 10),
                DialogBox(title: "Objetivos", description: "Formar científicos y tecnólogos que impulsen el desarrollo y progreso del país, a través de la asimilación de conocimientos, capacidades y habilidades que les permitan concebir, diseñar y desarrollar soluciones a problemas transdisciplinarios, económicos, sociales, tecnológicos y científicos, relacionados con el empleo de sistemas de IA y CD que interactúan con la realidad, el aprendizaje, el razonamiento y la adquisición de conocimiento, así como la extracción de información y la generación del conocimiento inmerso en acervos de datos, resultante de la aplicación de técnicas de análisis, diseño y síntesis de modelos."),
                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Ingreso", description: "El aspirante a la Maestría en Ciencia y Tecnología de Inteligencia Artificial y Ciencia de Datos (MCTIAYCD) es un profesionista egresado de una licenciatura en el campo de las TIC con sólidos conocimientos que le permitan abordar el análisis, diseño, desarrollo, implementación, y administración de sistemas computacionales. Aunado a esto, debe contar con dominio en las siguientes herramientas: cálculo diferencial e integral, matemáticas discretas, álgebra, álgebra lineal, probabilidad, programación estructurada, estructuras de datos, tipos de datos abstractos y organización de computadoras.\n\nEl aspirante se debe distinguir por su creatividad y capacidad de generar nuevos conocimientos para ser aplicados en la solución de problemas, y sentirse motivado para cultivar su vocación por la investigación, el desarrollo de las ciencias y la innovación tecnológica.\n\nTípicamente al programa aplican profesionales del área de ciencias físico-matemáticas egresados de las carreras de ingeniería en electrónica y comunicaciones, ciencias de la computación, sistemas computacionales, robótica y mecatrónica, telemática y otras relacionadas con las TIC."),

                SizedBox(height: 10,),
                DialogBox(title: "Perfil de Egreso", description: "El egresado de la MCTIAyCD cuenta con la capacidad crítica, aptitudes y habilidades que le permiten realizar investigación básica y aplicada en la solución de problemas, así como con la capacidad de adaptar y mejorar tecnología con un enfoque innovador, generando productos de alto valor agregado en el ámbito de las TIC, para contribuir así al desarrollo nacional.\n\nCon base en el desarrollo de habilidades de liderazgo y de colaboración en equipos interdisciplinarios y multidisciplinarios, el egresado podrá desempeñarse en organizaciones de los sectores público y privado, destacándose por su capacidad para comunicar sus puntos de vista y establecer vínculos de responsabilidad compartida en equipos de trabajo, aspectos que, combinados con el conocimiento adquirido en el programa, son demandados por el sector de las TIC."),

                SizedBox(height: 10,),
                DialogBox(title: "Mapa Curricular", description: "El plan de estudios de la MCTIAyCD consta de elementos que otorgan créditos y se desarrollan durante cuatro semestres. La o el estudiante debe cursar un mínimo de tres semestres, conforme con la ilustración del mapa curricular."),
                SizedBox(height: 10,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child:Image.network("https://i.ibb.co/wL1xDG8/mapacurricular-IACD.png",
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
                
                DownloadPdfButton(name: "https://drive.google.com/file/d/1CRuEk1qdmUYKPdQJld86wzwnwxTCvrV2/view?usp=sharing", career: "MCIACD", buttonText: "Mapa Curricular",header: "mapa_curricular_"),
                
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