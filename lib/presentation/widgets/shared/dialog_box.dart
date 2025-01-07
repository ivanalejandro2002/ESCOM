import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final String description;
  const DialogBox({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(title,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
          
          Text(description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}