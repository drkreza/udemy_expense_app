import 'package:flutter/material.dart';
import 'package:udemy_expense_app/model/expense.dart';
import 'package:udemy_expense_app/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expensesList});

  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) => ExpenseItem(expensesList[index]),
    );
  }
}
