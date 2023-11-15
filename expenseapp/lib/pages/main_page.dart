import 'package:expenseapp/pages/expenses_page.dart';
import 'package:expenseapp/widget/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "Expense App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense();
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const ExpensesPage(),
      backgroundColor: Colors.black87,
    );
  }
}
