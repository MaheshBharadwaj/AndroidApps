import 'package:flutter/material.dart';

class AddTransactions extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final Function _addButtonHandler;

  AddTransactions(this._addButtonHandler);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _titleController,
            style: TextStyle(
              color: Colors.lightBlue,
            ),
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          TextField(
            controller: _amountController,
            style: TextStyle(
              color: Colors.lightBlue,
            ),
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: Colors.white10,
            onPressed: () => _addButtonHandler(_titleController.text,_amountController.text),
            child: Text(
              'Add Transaction',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
