import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        //89
        itemBuilder: (ctx, idx) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                    '\$ : ${transactions[idx].amount.toStringAsFixed(2)}',
                    //90
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[idx].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(DateFormat.yMMMd().format(transactions[idx].date),
                      style: TextStyle(fontSize: 12, color: Colors.grey))
                ],
              )
            ],
          ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
