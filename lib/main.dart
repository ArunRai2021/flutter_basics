import 'package:flutter/material.dart';
import 'package:flutter_poc/mealApp/screen/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mealApp/screen/categories.dart';

/// this main method is for Quiz app(5-7line no)
// void main() {
//   runApp(const Quiz());
// }

/// this main Method is Used for Dice Roller app(10-15 line no)
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: GradientContainer(color1: Colors.yellow, color2: Colors.black),
//   ));
// }
/// part of Expense tracker App (16-63 line no)
// var kColorScheme =
//     ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
//
// var kDarkColorScheme = ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 5, 99, 125));

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
/// this main is used for todoApp(65-67)
// void main() {
//   runApp(const TodoApp());
// }

/// meal App
void main() {
  runApp(const ProviderScope(child: App()));
}

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 131, 57, 0)),
    textTheme: GoogleFonts.latoTextTheme());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const TabsScreen());
  }
}
