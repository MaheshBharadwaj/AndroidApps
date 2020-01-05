import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;
  final Function _showDeleteModalSheet;

  TransactionList(this._transactionList, this._showDeleteModalSheet);

  @override
  /*Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemCount:
            (10 < _transactionList.length) ? 10 : _transactionList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  flex: 3,
                  child: Container(
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
                ),
                /*
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                ),
                */
                Flexible(
                  fit: FlexFit.tight,
                  flex: 5,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          _transactionList[index].title,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).primaryTextTheme.title,
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .format(_transactionList[index].date),
                          style: Theme.of(context).primaryTextTheme.body2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    */
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
