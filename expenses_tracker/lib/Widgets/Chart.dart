import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';
import 'ChartBar.dart';

class Chart extends StatelessWidget {
  final List<MyTransaction> _recentTransactionsList;

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

      return {'day': DateFormat.E().format(weekDay), 'amount': total};
    }).reversed.toList();
  }

  double get totalSpending {
    double sum = 0.0;
    for (var data in groupedTransactionValues)
      sum += (data['amount'] as double);
    return sum;
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ...groupedTransactionValues.map((data) {
            return ChartBar(
                data['day'].toString().substring(0, 1),
                (data['amount'] as double),
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending);
          }).toList()
        ],
      ),
    );
  }
}
