import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Text('The Chart'),
      ],
    ));
  }
}
