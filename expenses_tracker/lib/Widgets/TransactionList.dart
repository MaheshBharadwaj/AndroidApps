import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;
  final Function _showDeleteModalSheet;

  TransactionList(this._transactionList, this._showDeleteModalSheet);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemCount: 10 < _transactionList.length ? 10 : _transactionList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              onTap: () {},
              onLongPress: () => _showDeleteModalSheet(context, index),
              leading: CircleAvatar(
                radius: 30,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      _transactionList[index].amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                _transactionList[index].title,
                style: Theme.of(context).primaryTextTheme.title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(_transactionList[index].date),
                style: Theme.of(context).primaryTextTheme.body2,
              ),
              trailing: IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete_outline, size: 30),
                onPressed: () =>_showDeleteModalSheet(context,index),
              ),
              
            ),
          );
        },
      ),
    );
  }
}
