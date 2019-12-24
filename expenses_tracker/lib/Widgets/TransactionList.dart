import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactionList.map((transaction) {
        return Card(
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    fontSize: 27.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      transaction.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transaction.date),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
