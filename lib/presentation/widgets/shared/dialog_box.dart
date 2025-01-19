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
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(title,
            style: TextStyle(
              color: colors.tertiaryFixed,
              fontSize: 30,
            ),
          ),
          
          Text(description,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}