import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.onAdd, {Key? key}) : super(key: key);
  final void Function(Expense expense) onAdd;
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  void _openDatePicker() async {
    DateTime today = DateTime.now(); // 16.11.2023
    // 2022, 11, 16
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);
    // showDatePicker(
    //         context: context,
    //         initialDate: today,
    //         firstDate: oneYearAgo,
    //         lastDate: today)
    // .then((value) {
    //   async işlemden cevap ne zaman gelirse bu bloğu çalıştır..
    //   print(value);
    // });
    // async function => await etmek
    // nullable

    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? today : _selectedDate!,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });
    print("Merhaba");
    // sync => bir satır çalışmasını bitirmeden alt satıra geçemez.
    // async => async olan satır sadece tetiklenir kod aşağıya doğru çalışmaya devam eder
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: InputDecoration(labelText: "Harcama Adı"),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expensePriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Harcama Miktarı", prefixText: "₺"),
                ),
              ),
              IconButton(
                  onPressed: () => _openDatePicker(),
                  icon: const Icon(Icons.calendar_month)),
              // ternary operator
              Text(_selectedDate == null
                  ? "Tarih Seçiniz"
                  : DateFormat.yMd().format(_selectedDate!)),
            ],
            // String?  a
            // String => a!
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  })
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Kapat")),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    double? price =
                        double.tryParse(_expensePriceController.text);

                    // validation

                    Expense expense = Expense(
                        name: _expenseNameController.text,
                        price: price!,
                        date: _selectedDate!,
                        category: _selectedCategory);
                    widget.onAdd(expense);
                    Navigator.pop(context);
                  },
                  child: Text("Ekle")),
            ],
          ),
        ]),
      ),
    );
  }
}
