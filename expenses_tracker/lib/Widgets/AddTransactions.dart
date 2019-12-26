import 'package:flutter/material.dart';

class AddTransactions extends StatefulWidget {
  final Function _addButtonHandler;

  AddTransactions(this._addButtonHandler);

  @override
  _AddTransactionsState createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (_) {},
            keyboardType: TextInputType.text,
            controller: _titleController,
            style: TextStyle(
              color: Colors.lightBlue,
            ),
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            onSubmitted: (_) => widget._addButtonHandler(
                _titleController.text, _amountController.text),
            keyboardType: TextInputType.number,
            controller: _amountController,
            style: TextStyle(
              color: Colors.lightBlue,
            ),
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: Colors.white10,
            onPressed: () => widget._addButtonHandler(
                _titleController.text, _amountController.text),
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
