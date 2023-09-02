import 'package:flutter/material.dart';
import 'package:udemy_expense_app/widgets/expenses_list.dart';
import 'package:udemy_expense_app/model/expense.dart';
import 'package:udemy_expense_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  final List<Expense> _expensesList = [
    Expense(
        title: 'buy coffee',
        amount: 8,
        date: DateTime.now(),
        category: Category.shop),
    Expense(
        title: 'entertainment',
        amount: 50,
        date: DateTime.now(),
        category: Category.rent),
  ];

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) =>  NewExpense(onExpenseAdd: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      widget._expensesList.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expence app ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(
              expensesList: widget._expensesList,
            ),
          ),
        ],
      ),
    );
  }
}
