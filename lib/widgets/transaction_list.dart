import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text('No transactions added yet',
                      style: Theme.of(context).textTheme.headline6),
                  Container(
                      //96
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              );
            },
          )
        : ListView.builder(
            //89
            itemBuilder: (ctx, idx) {
              return TransactionItem(transaction: transactions[idx], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}


