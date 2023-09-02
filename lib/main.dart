import 'package:flutter/material.dart';
import 'package:udemy_expense_app/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}
