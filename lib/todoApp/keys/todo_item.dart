import 'package:flutter/material.dart';
import 'keys.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.text, required this.priority});

  final String text;
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;
    if (priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }
    if (priority == Priority.normal) {
      icon = Icons.list;
    }
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 12,
        ),
        Text(text)
      ],
    );
  }
}
