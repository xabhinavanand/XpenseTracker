import 'package:expensetracker/ExpensesAndIncome.dart';
import 'package:expensetracker/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EnterPage extends StatefulWidget {
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  Transact transact = Transact();
  final dbHelper = DatabaseHelper.instance;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff17395c),
        body: Column(
          children: <Widget>[
            Container(
                height: 200,
                width: 200,
                child: Lottie.asset("assets/wallet.json")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                decoration: InputDecoration(hintText: "Enter Amount"),
                onChanged: (val) {
                  setState(() {
                    transact.amount = val as int;
                  });
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      transact.type = "Food";
                    },
                    child: MyButton(Color(0xff62CAE4), "Food")),
                FlatButton(
                    onPressed: () {
                      transact.type = "Shopping";
                    },
                    child: MyButton(Color(0xffEA676D), "Shopping")),
                FlatButton(
                    onPressed: () {
                      transact.type = "Travel";
                    },
                    child: MyButton(Color(0xff4BC076), "Travel")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      transact.type = "Education";
                    },
                    child: MyButton(Color(0xffFDB858), "Education")),
                FlatButton(
                    onPressed: () async {
                      await dbHelper.queryAll();
                    },
                    child: MyButton(Color(0xff7D8EE1), "Medicines")),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2101));
                  transact.date = date;
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Date Picker",
                      style: GoogleFonts.quicksand(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () async {
                  var json = transact.toMap();
                  int i = await dbHelper.insert(json);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: GoogleFonts.quicksand(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  MyButton(this.colour, this.txt);

  final Color colour;
  final String txt;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 90,
      decoration: BoxDecoration(
          color: widget.colour, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          widget.txt,
          style:
              GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
