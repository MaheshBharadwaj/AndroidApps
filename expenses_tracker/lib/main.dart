import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactionList = [
    Transaction(
      id: 'T1',
      title: 'Shoes',
      amount: 1500.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Jeans',
      amount: 2399.0,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            'Expenses App!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
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
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: transactionList.map((transaction) {
                  return Card(
                    color: Colors.white10,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            /*
                            border: Border.all(
                              color: Colors.lightGreenAccent,
                              width: 1.5,
                            ),
                            */
                          ),
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                          child: Text(
                            "\u20B9 " + transaction.amount.toString(),
                            style: TextStyle(
                              color: Colors.indigoAccent,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              transaction.title,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                              ),
                            ),
                            Text(
                              DateFormat().format(transaction.date),
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
