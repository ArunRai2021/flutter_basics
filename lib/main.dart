import 'package:flutter/material.dart';
import 'package:flutter_poc/todoApp/todo_app.dart';

import 'ExpenseTracker/widget/expenses.dart';

/// this main method is for Quiz app
// void main() {
//   runApp(const Quiz());
// }

/// this main Method is Used for Dice Roller app
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: GradientContainer(color1: Colors.yellow, color2: Colors.black),
//   ));
// }

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

/// this main Method is For Expense Tracker App
// void main() {
//   /// this is only for Portrait mode ..
//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations([
//   //   DeviceOrientation.portraitUp,
//   // ]).then((fn) {
//   runApp(MaterialApp(
//       darkTheme: ThemeData.dark().copyWith(
//         useMaterial3: true,
//         colorScheme: kDarkColorScheme,
//         cardTheme: const CardTheme().copyWith(
//             color: kDarkColorScheme.secondaryContainer,
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: kColorScheme.primaryContainer,
//                 foregroundColor: kDarkColorScheme.onPrimaryContainer)),
//       ),
//       theme: ThemeData().copyWith(
//           useMaterial3: true,
//           colorScheme: kColorScheme,
//           appBarTheme: const AppBarTheme().copyWith(
//               backgroundColor: kColorScheme.onPrimaryContainer,
//               foregroundColor: kColorScheme.primaryContainer),
//           cardTheme: const CardTheme().copyWith(
//               color: kColorScheme.secondaryContainer,
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
//           elevatedButtonTheme: ElevatedButtonThemeData(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: kColorScheme.primaryContainer)),
//           textTheme: ThemeData().textTheme.copyWith(
//               titleLarge: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: kColorScheme.onSecondaryContainer,
//                   fontSize: 16))),
//       debugShowCheckedModeBanner: false,
//       home: const Expenses()));
//   // });
// }
/// this main is used for todoApp
void main() {
  runApp(const TodoApp());
}
