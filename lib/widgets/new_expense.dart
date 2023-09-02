import 'package:flutter/material.dart';
import 'package:udemy_expense_app/model/expense.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onExpenseAdd});

  void Function(Expense expense) onExpenseAdd;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // String _expenseTitle = '';
  // void _saveExpenseTitle(String title) {
  //   _expenseTitle = title;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.sport;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _displayDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveExpense() {
    widget.onExpenseAdd(Expense(
        title: _titleController.text.trim(),
        amount: double.tryParse(_amountController.text.trim())!,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('expense saved successfully'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Got it!',
          onPressed: () {
            
          },
        ),
      ),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _saveExpenseTitle,
            maxLength: 50,
            // keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefix: Text('\$ '),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _displayDatePicker,
                      icon: const Icon(Icons.date_range_outlined),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('cancel'),
              ),
              const SizedBox(
                width: 8.0,
              ),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('save expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
