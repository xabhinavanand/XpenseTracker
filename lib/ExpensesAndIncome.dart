import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
class ExpensesData
{
  String st;
  double savings;
  double expenses=0;
  var colour;
  ExpensesData(this.st,this.savings,this.colour);
}
class MonthlyData
{
  String month;
  int spent;
  int earned;
  MonthlyData(this.month,this.earned,this.spent);
}


class Transact {
  Transact({
    this.id,
    this.amount,
    this.date,
    this.isSpent,
    this.type,
  });

  int id;
  int amount;
  DateTime date;
  int isSpent;
  String type;

  factory Transact.fromMap(Map<String, dynamic> json) => Transact(
    id: json["id"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    isSpent: json["isSpent"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "amount": amount,
    "date": date.toIso8601String(),
    "isSpent": isSpent,
    "type": type,
  };
}
