import 'package:flutter/material.dart';
import 'dart:math';
import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Tenis TU',
      value: 310.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Eletrobras',
      value: 350.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Aluguel',
      value: 500,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextInt(99999).toString(),
      title: title,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((_transactions) => _transactions.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions, _removeTransaction),
      ],
    );
  }
}
