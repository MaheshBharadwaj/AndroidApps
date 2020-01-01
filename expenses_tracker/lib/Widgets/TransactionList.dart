import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;

  TransactionList(this._transactionList);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemCount: (10 < _transactionList.length) ? 10: _transactionList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.green,
                      width: 2.5,
                    ),
                  ),
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 5.0,
                  ),
                  child: Text(
                    "\u20B9 " + _transactionList[index].amount.toString(),
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
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        _transactionList[index].title,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).primaryTextTheme.title,
                      ),
                      Text(
                        DateFormat.yMMMd().format(_transactionList[index].date),
                        style: Theme.of(context).primaryTextTheme.body2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
