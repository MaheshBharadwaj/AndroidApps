import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
  List<MyTransaction> _transactionList = [];

  Future<Database> getDatabase(String path) async {
    Database db =
        await openDatabase(path, onCreate: (Database db, int version) async {
      await db.execute('''create table Transactions(
            id TEXT PRIMARY KEY,
            title TEXT,
            amount NUMBER,
            date_t DATE)''');
    });
  }

  Future<void> insertTransaction(final MyTransaction T) async {
    // Get a reference to the database.
    final String path = join(await getDatabasesPath(), 'Transacitions.db');
    final Database db = await getDatabase(path);

    await db.insert(
      'Transactions',
      T.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MyTransaction>> getTransactionsList() async {
    // Get a reference to the database.
    final String path = join(await getDatabasesPath(), 'Transacitions.db');
    final Database db = await getDatabase(path);

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('Transactions');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return MyTransaction(
        id: maps[i]['id'],
        title: maps[i]['title'],
        amount: (maps[i]['amount'] as double),
        date: (maps[i]['date_t'] as DateTime),
      );
    });
  }

  Future<void> deleteTransaction(int id) async {
    // Get a reference to the database.
    final String path = join(await getDatabasesPath(), 'Transacitions.db');
    final Database db = await getDatabase(path);

    await db.delete(
      'Transactions',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /*
  List<MyTransaction>  get _recentTransactionsList{
    return _transactionList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  */

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

  void _deleteHandler(BuildContext context, int index) {
    if (index != -1)
      setState(() {
        _transactionList.removeAt(index);
      });
    Navigator.of(context).pop();
  }

  /*
  void _addHandler(BuildContex context,String title, String amount, DateTime date) {
    if (date == null) return;

    Navigator.of(context).pop();

    if (title == '' || amount == '') return;

    setState(() {
      _transactionList.add(MyTransaction(
        amount: double.parse(amount),
        date: date,
        id: 'T${_transactionList.length}',
        title: title,
      ));
    });

    //Close the modal sheets
  }
  */
  void _addHandler (
      BuildContext context, String title, String amount, DateTime date) async {
    if (date == null) return;

    Navigator.of(context).pop();

    if (title == '' || amount == '') return;
    await insertTransaction(MyTransaction(
      amount: double.parse(amount),
      date: date,
      id: 'T${_transactionList.length}',
      title: title,
    ));
    
    setState(() {
      _transactionList.add(MyTransaction(
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
                  0.27,
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
                        0.73,
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
