import 'package:flutter/foundation.dart';

//For @required

class MyTransaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  MyTransaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': "$id",
      'title': title,
      'amount': amount.toString(),
      'date_t': date.millisecondsSinceEpoch.toString(),
    };
  }

  String toString(){
    return "Title: $title,ID: $id";
  }
}

