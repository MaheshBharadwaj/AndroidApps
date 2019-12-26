import 'package:flutter/material.dart';

import 'TransactionList.dart';
import 'AddTransactions.dart';
import '../Models/Transaction.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  
  List<Transaction> _transactionList = [
    Transaction(
      title: 'Shoes',
      amount: 2500.0,
      id: 'T0',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Earphones',
      amount: 1000.0,
      id: 'T1',
      date: DateTime.now(),
    ),
  ];


  void _showAddModalSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (BuildContext _) {
          return GestureDetector(
            onTap: () {},
            child: AddTransactions(_buttonHandler),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _buttonHandler(String title, String amount) {
    if (title == '' || amount == '') return;

    setState(() {
      _transactionList.add(Transaction(
        amount: double.parse(amount),
        date: DateTime.now(),
        id: 'T${_transactionList.length}',
        title: title,
      ));
    });

    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddModalSheet(context),
            iconSize: 35.0,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Expenses App!',
          /*
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
          */
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  color: Colors.blue,
                  child: Text(
                    'CHART',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              TransactionList(_transactionList),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.0,
        ),
        onPressed: () {
          _showAddModalSheet(context);
        },
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

}
