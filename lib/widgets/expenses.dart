import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _userExpenses = [
    Expense(
      title: 'Jumboo Mayo',
      amount: 180,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'BashirBhai Shawarma',
      amount: 150,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Carpool',
      amount: 500,
      date: DateTime.now(),
      category: Category.transportation,
    ),
  ];

  void _openAddExpenseOverlay() async {
    var toAdd = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const NewExpense(),
    );
    if (toAdd != null) {
      _addExpense(toAdd);
    }
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _userExpenses.add(newExpense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Added!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                _userExpenses.remove(newExpense);
              },
            );
          },
        ),
      ),
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _userExpenses.indexOf(expense);
    setState(() {
      _userExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Removed!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                _userExpenses.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('There are no Expenses!'),
    );

    if (_userExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _userExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(title: const Text('Expense Tracker'), actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ]),
        body: Column(
          children: [
            const Text('The Chart'),
            Expanded(
              child: mainContent,
            ),
          ],
        ));
  }
}
