import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController(); //84
  final amountController = TextEditingController(); //84

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) { //90
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController, //84
              onSubmitted: (_) => submitData(), //90
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController, //84
              keyboardType: TextInputType.number, //90
              onSubmitted: (_) => submitData(), //90
            ),
            FlatButton(
                onPressed: submitData,
                textColor: Colors.purple,
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
