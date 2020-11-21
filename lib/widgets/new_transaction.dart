import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //90
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop(); //93 - closing modal
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            RaisedButton(
                onPressed: submitData,
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
