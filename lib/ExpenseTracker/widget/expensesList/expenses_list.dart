import 'package:flutter/material.dart';
import 'package:flutter_poc/ExpenseTracker/widget/expensesList/expense_item.dart';
import '../../model/expenseModel.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpenses});

  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: EdgeInsets.symmetric(),
              ),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                onRemoveExpenses(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]));
        });
  }
}
