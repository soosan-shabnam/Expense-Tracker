import 'package:flutter/material.dart';
import 'package:tracker/widgets/expenses_list/expenses_list.dart';
import 'package:tracker/models/expense.dart';
import 'package:tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  void _openAddExpensesOverlay(){
    showModalBottomSheet(context: context, builder:(ctx)=> const NewExpense(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Expense Tracker'),
        actions:[
          IconButton(
            onPressed:_openAddExpensesOverlay,
            icon: const Icon(Icons.add),),
        ],
      ),
      body: Column(children: [
        Text('The chart'),
        Expanded(
          child: ExpensesList(expenses: _registeredExpenses),
        ),
      ]),
    );
  }
}
