import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/new_transaction.dart';
import 'package:expenses/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'beer', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't3', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't4', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't5', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't6', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't7', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't8', title: 'car', amount: 177.7, date: DateTime.now()),
    Transaction(id: 't9', title: 'car', amount: 177.7, date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction), //87
        TransactionList(_userTransactions)
      ],
    );
  }
}
