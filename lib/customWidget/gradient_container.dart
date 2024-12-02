import 'package:flutter/material.dart';
import 'package:flutter_poc/customWidget/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.color1, required this.color2});

  final Color color1;
  final Color color2;

  static const startAlignment = Alignment.topLeft;
  static const endAlignment = Alignment.bottomRight;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [color1, color2],
        begin: startAlignment,
        end: endAlignment,
      )),
      child: const Center(
        child: DiceRoller()
      ),
    );
  }
}
