import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactionsList;

  Chart(this._recentTransactionsList);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (int index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double total = 0.0; 

      for (int i = 0; i < _recentTransactionsList.length; i++)
        if (_recentTransactionsList[i].date.day == weekDay.day &&
            _recentTransactionsList[i].date.month == weekDay.month &&
            _recentTransactionsList[i].date.year == weekDay.year)
          total += _recentTransactionsList[i].amount;

      return{
        'day':DateFormat.E().format(weekDay),
        'amount':total
      };
    });
  }

  Widget build(BuildContext context) {
    print(groupedTransactionValues); 
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[],
        ),
      ),
    );
  }
}
