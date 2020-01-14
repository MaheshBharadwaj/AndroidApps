import 'package:flutter/material.dart';

import 'TransactionList.dart';
import 'AddTransactions.dart';
import 'Chart.dart';
import 'DeleteTransaction.dart';

import '../Models/Transaction.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  /*
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
  */
  List<Transaction> _transactionList = [];

  List<Transaction> get _recentTransactionsList {
    return _transactionList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _showDeleteModalSheet(BuildContext context, int index) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (BuildContext _) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: DeleteTransaction(_deleteHandler, index),
          );
        });
  }

  void _showAddModalSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (BuildContext _) {
        return GestureDetector(
          onTap: () {},
          child: AddTransactions(_addHandler),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteHandler(int index) {
    if (index != -1)
      setState(() {
        _transactionList.removeAt(index);
      });
    Navigator.of(context).pop();
  }

  void _addHandler(String title, String amount, DateTime date) {
    if (date == null) return;

    Navigator.of(context).pop();

    if (title == '' || amount == '') return;

    setState(() {
      _transactionList.add(Transaction(
        amount: double.parse(amount),
        date: date,
        id: 'T${_transactionList.length}',
        title: title,
      ));
    });

    //Close the modal sheets
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
        'Expenses Tracker!',
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.vertical) *
                  0.25,
              child: Chart(_recentTransactionsList),
            ),
            (_transactionList.isEmpty)
                ? Column(
                    children: <Widget>[
                      Container(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.vertical) *
                            0.65,
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        'No Transactions to Show',
                        style: Theme.of(context).primaryTextTheme.body1,
                      ),
                    ],
                  )
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.vertical) *
                        0.75,
                    child: TransactionList(
                        _transactionList, _showDeleteModalSheet),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
