
import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  const CardFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.update_outlined),
          label: const Text("Actualizar"),
        ),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.delete_outline),
          label: const Text("Eliminar"),
        ),
      ],
    );
  }
}
