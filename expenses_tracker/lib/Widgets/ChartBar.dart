import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _day;
  final double _amount;
  final double _perTotal;

  ChartBar(this._day, this._amount, this._perTotal);

  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.14,
                child: FittedBox(
                  child: Text(
                    '$_amount',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.04,
              ),
              Container(
                height: constraints.maxHeight * 0.57,
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
              SizedBox(
                height: constraints.maxHeight * 0.04,
              ),
              Container(
                height: constraints.maxHeight * 0.14,
                child: FittedBox(
                  child: Text(
                    _day,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
