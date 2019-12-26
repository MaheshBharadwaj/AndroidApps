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
        color: Theme.of(context).accentColor,
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
              labelStyle: Theme.of(context).primaryTextTheme.caption,
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
              labelStyle: Theme.of(context).primaryTextTheme.caption,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          RaisedButton(
            color: Colors.white10,
            padding: EdgeInsets.all(10.0),
            onPressed: () => widget._addButtonHandler(
                _titleController.text, _amountController.text),
            child: Text(
              'Add Transaction',
              style: Theme.of(context).primaryTextTheme.button,
            ),
          )
        ],
      ),
    );
  }
}
