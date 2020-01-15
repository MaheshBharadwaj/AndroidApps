import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactions extends StatefulWidget {
  final Function _addButtonHandler;

  AddTransactions(this._addButtonHandler);

  @override
  _AddTransactionsState createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  DateTime _pickedDate;
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _pickedDate = pickedDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            onSubmitted: (_) {},
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
          Text(
            _pickedDate != null
                ? DateFormat.yMMMd().format(_pickedDate)
                : 'No date Choosen!',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                color: Colors.indigoAccent,
                icon: Icon(
                  Icons.calendar_today,
                  size: 30.0,
                ),
                onPressed: () => _showDatePicker(context),
              ),
              IconButton(
                  color: Colors.green,
                  icon: Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                  onPressed: () => widget._addButtonHandler(
                        context,
                        _titleController.text,
                        _amountController.text,
                        _pickedDate,
                      )),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.red,
                icon: Icon(
                  Icons.close,
                  size: 30.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
