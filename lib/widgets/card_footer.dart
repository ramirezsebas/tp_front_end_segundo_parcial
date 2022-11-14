import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  const CardFooter({
    Key? key,
    required this.onDelete,
    this.onEdit,
  }) : super(key: key);

  final VoidCallback onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onEdit != null)
          ElevatedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.update_outlined),
            label: const Text("Actualizar"),
          ),
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
