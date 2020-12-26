import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.headline6),
                Container(
                    //96
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              //89
              itemBuilder: (ctx, idx) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              child: Text('${transactions[idx].amount}')),
                        )),
                    title: Text(transactions[idx].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[idx].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[idx].id) ,)
                  ),
                );
              },
              itemCount: transactions.length,
            );
  }
}
