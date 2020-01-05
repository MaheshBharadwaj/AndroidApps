import 'package:flutter/material.dart';

class DeleteTransaction extends StatelessWidget {
  final Function _deleteHandler;
  final int _index;

  DeleteTransaction(this._deleteHandler, this._index);

  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).accentColor,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Are you sure you want to delete this entry?',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                color: Colors.red,
                icon: Icon(
                  Icons.delete,
                  size: 30.0,
                ),
                onPressed: () => _deleteHandler(_index),
              ),
              IconButton(
                color: Colors.green,
                icon: Icon(
                  Icons.cancel,
                  size: 30.0,
                ),
                onPressed: () => _deleteHandler(-1),
              )
            ],
          )
        ],
      ),
    );
  }
}
