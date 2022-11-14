import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  const CardFooter({
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ElevatedButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(Icons.update_outlined),
        //   label: const Text("Actualizar"),
        // ),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline),
          label: const Text("Eliminar"),
        ),
      ],
    );
  }
}
