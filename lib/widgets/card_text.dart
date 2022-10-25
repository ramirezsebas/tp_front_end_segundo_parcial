
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(text),
      ],
    );
  }
}
