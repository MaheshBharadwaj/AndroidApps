import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _day;
  final double _amount;
  final double _perTotal;

  ChartBar(this._day, this._amount, this._perTotal);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: Text(
              '$_amount',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          Container(
            height: 75.0,
            width: 10.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: _perTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 5.0,
            ),
          ),
          Text(
            _day,
            style: TextStyle(color: Colors.green, fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
