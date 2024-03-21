import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _userExpenses = [
    Expense(
      title: 'Jumboo Mayo',
      amount: 180,
      date: DateTime.now(),
      category: Category.foodAndGroceries,
    ),
    Expense(
      title: 'BashirBhai Shawarma',
      amount: 150,
      date: DateTime.now(),
      category: Category.foodAndGroceries,
    ),
    Expense(
      title: 'Carpool',
      amount: 500,
      date: DateTime.now(),
      category: Category.transportation,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'), actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ]),
        body: Column(
          children: [
            const Text('The Chart'),
            Expanded(child: ExpensesList(expenses: _userExpenses)),
          ],
        ));
  }
}
