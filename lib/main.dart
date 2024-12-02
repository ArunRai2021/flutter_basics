import 'package:flutter/material.dart';
import 'package:flutter_poc/customWidget/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(
          body: GradientContainer(
            color1: Color.fromARGB(255, 33, 5, 109),
            color2: Color.fromARGB(255, 68, 21, 149),
          ),
        ));
  }
}
