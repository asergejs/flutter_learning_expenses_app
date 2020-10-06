import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();  //84
  final amountController = TextEditingController();  //84

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController, //84
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController, //84
            ),
            FlatButton(
                onPressed: () {
                  addTx(titleController.text, double.parse(amountController.text));
                },
                textColor: Colors.purple,
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
