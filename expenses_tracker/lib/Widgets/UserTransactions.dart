import 'package:flutter/material.dart';

import './AddTransactions.dart';
import './TransactionList.dart';
import '../Models/Transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactionList = [
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

  void _buttonHandler(String title, String amount) {
    if(title == '' || amount == '')
      return;
      
    setState(() {
      transactionList.add(Transaction(
        amount: double.parse(amount),
        date: DateTime.now(),
        id: 'T${transactionList.length}',
        title: title,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        AddTransactions(_buttonHandler),
        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        TransactionList(transactionList),
      ],
    ));
  }
}
