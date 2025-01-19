import 'package:flutter/material.dart';
import 'package:gestor/domain/entities/materias.dart';
import 'package:gestor/presentation/widgets/grid_icon.dart';

List<Materias> elements = [
  Materias(
      photoSource:
          'https://itcampeche.edu.mx/wp-content/uploads/2018/09/Informatica.jpg',
      name: 'ISC'),
  Materias(
      photoSource:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT28ffmdl5EM4_CsdpZKkz9O-qEVbDhzjS6lQ&s',
      name: 'IIA'),
  Materias(
      photoSource:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVveccCdUYqCA1KDtU_zqk8L5d3ar53p52bQ&s',
      name: 'LCD'),
  Materias(
      photoSource:
          'https://itcampeche.edu.mx/wp-content/uploads/2018/09/Informatica.jpg',
      name: 'MCSCM'),
  Materias(
      photoSource:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT28ffmdl5EM4_CsdpZKkz9O-qEVbDhzjS6lQ&s',
      name: 'MCIIA'),
  Materias(
      photoSource:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVveccCdUYqCA1KDtU_zqk8L5d3ar53p52bQ&s',
      name: 'MCCD'),
];

class CareerGrid extends StatelessWidget {
  const CareerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Text(
          'Oferta Educativa',
          style: TextStyle(
            color: colors.tertiaryFixed,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 300,
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(elements.length, (index) {
              return GridIcon(
                  imageSource: elements[index].photoSource,
                  title: elements[index].name);
            }),
          ),
        ),
      ],
    );
  }
}
