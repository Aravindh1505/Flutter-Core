import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _addTx() {
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _triggerDatePickerDialog() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.name,
            onSubmitted: (_) => _addTx(),
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _addTx(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                _selectedDate == null ? 'No date chosen' : DateFormat.yMd().format(_selectedDate!),
              ),
              TextButton(
                onPressed: _triggerDatePickerDialog,
                child: const Text('Choose Date'),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(onPressed: _addTx, child: const Text('Add Transaction'))
        ],
      ),
    );
  }
}
