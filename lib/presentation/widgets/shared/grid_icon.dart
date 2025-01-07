import 'package:flutter/material.dart';

class GridIcon extends StatelessWidget {
  final String imageSource;
  final String title;
  const GridIcon({
    super.key,
    required this.imageSource,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageSource),
        ),
        Text(title,style: TextStyle(
          color: Colors.black,
          fontSize: 30
        ))
      ],
    );
  }
}