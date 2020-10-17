import 'package:expenses/widgets/new_transaction.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses',
      theme: ThemeData(
          //94
          primarySwatch: Colors.green,
          accentColor: Colors.lightBlueAccent,
          fontFamily: 'Quicksand',
          //95
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              //95
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal expenses'), //95
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Container(
                height: 30,
                width: 150,
                color: Colors.green,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Other'),
                ),
              )
            ]),
            TransactionList(_userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //91
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ), //91
    );
  }
}
