import 'package:flutter/material.dart';
import 'package:flutter_poc/ExpenseTracker/widget/chart/chart.dart';
import 'package:flutter_poc/ExpenseTracker/widget/expensesList/expenses_list.dart';
import 'package:flutter_poc/ExpenseTracker/model/expenseModel.dart';
import 'package:flutter_poc/ExpenseTracker/widget/new_expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
        amount: 19.99,
        date: DateTime.now(),
        title: "Flutter Course",
        category: Category.work),
    ExpenseModel(
        amount: 15.69,
        date: DateTime.now(),
        title: "Cinema",
        category: Category.leisure),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return NewExpenses(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  /// remove expenses
  void _removeExpenses(ExpenseModel expenses) {
    final expenseIndex = _registeredExpenses.indexOf(expenses);
    setState(() {
      _registeredExpenses.remove(expenses);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenses);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No Expense Found Start adding some"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpenses: _removeExpenses);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Expenses",
          ),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverLay, icon: const Icon(Icons.add)),
          ]),
      body: width < 600
          ? Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent)
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent)
              ],
            ),
    );
  }
}
