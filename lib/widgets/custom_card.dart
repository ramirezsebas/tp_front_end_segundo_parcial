import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.cardData,
  }) : super(key: key);

  final Widget cardData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Colors.black, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cardData,
      ),
    );
  }
}
