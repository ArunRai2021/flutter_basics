import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});

  @override
  State<DemoButtons> createState() => _DemoButtonsState();
}

class _DemoButtonsState extends State<DemoButtons> {
  var _isUnderStood = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    _isUnderStood = false;
                  });
                },
                child: const Text("No")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _isUnderStood = true;
                  });
                },
                child: const Text("Yes"))
          ],
        ),
        if (_isUnderStood) const Text("Awesome")
      ],
    );
  }
}
