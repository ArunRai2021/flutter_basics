import 'package:flutter/material.dart';
import 'package:flutter_poc/ExpenseTracker/expenses.dart';

/// this main method is for Quiz app
// void main() {
//   runApp(const Quiz());
// }

/// this main Method is For Expense Tracker App
void main() {
  runApp(
      const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Expenses()));
}
