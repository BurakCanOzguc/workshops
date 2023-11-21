import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  var selectedDate = DateTime.now();
  var expenseDateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
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
          TextField(
            controller: _expensePriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Harcama Miktarı"),
          ),
          IconButton(
            onPressed: () {
              selectDate();
            },
            icon: Icon(Icons.calendar_month),
          ),
          Text(DateFormat.yMd().format(selectedDate)),
          Text("Tarih Seçiniz"),

          /*ElevatedButton(onPressed:({
            Navigator.pop(context);
          
          }), burada en son seçtiği yerden kalmasını sağlyor tkavimin. yani tekrar tıklandığında en son seçtğiği sayfada kalıyor.*/

          ElevatedButton(
              onPressed: () {
                print(
                    "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceController.text}");
              },
              child: Text("Ekle"))
        ]),
      ),
    );
  }
}
