import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 'ID0',
        title: 'ROG Flow X13',
        amount: 153999,
        dateTime: DateTime.now()),
    Transaction(
        id: 'ID2',
        title: 'LG-Ultrawide',
        amount: 52000,
        dateTime: DateTime.now()),
    Transaction(
        id: 'ID1',
        title: 'MacBook Pro',
        amount: 400000,
        dateTime: DateTime.now()),
  ];
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  var openText = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade800,
            title: Text(
              'PERSONAL EXPENSES  ',
              style: GoogleFonts.raleway(
                  fontSize: 35,
                  color: Colors.yellow[500],
                  fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 12, top: 10),
                    width: double.infinity,
                    height: 50,
                    child: Card(
                      child: Text(
                        'Weekly chart',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 12, top: 10),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        color: Colors.grey[850],
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextField(
                              style: GoogleFonts.raleway(
                                  fontSize: 19,
                                  color: Colors.yellow[500],
                                  fontWeight: FontWeight.w500),
                              controller: titleInput,
                              // onChanged: (value) => titleInput = value,
                              cursorHeight: 30,
                              cursorColor: Colors.yellow,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelStyle: GoogleFonts.raleway(
                                    fontSize: 19,
                                    color: Colors.yellow[500],
                                    fontWeight: FontWeight.w500),
                                labelText: 'Now what did you purchase ? ',
                                focusColor: Colors.yellow,
                              ),
                            ),
                            TextField(
                              controller: amountInput,

                              style: GoogleFonts.raleway(
                                  fontSize: 19,
                                  color: Colors.yellow[500],
                                  fontWeight: FontWeight.w500),
                              // onChanged: (value) => amountInput = value,
                              cursorHeight: 30,
                              cursorColor: Colors.yellow,

                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.yellow),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelStyle: GoogleFonts.raleway(
                                      fontSize: 19,
                                      color: Colors.yellow[500],
                                      fontWeight: FontWeight.w500),
                                  labelText: 'How much did it cost you ?'),
                            ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () => {
                                  print(titleInput.text),
                                  print(amountInput.text),
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.yellow,
                                    minimumSize: Size(100, 40)),
                                child: Text(
                                  'Add your expense',
                                  style: GoogleFonts.raleway(
                                    fontSize: 30,
                                    color: Colors.blueGrey[900],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 5),
                    width: double.infinity,
                    child: Column(
                      children: transaction.map((tx) {
                        return Card(
                          color: Colors.grey[800],
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //       left: 20, top: 10, right: 20, bottom: 10),
                                      //   child: Text(
                                      //     'Amount Spent',
                                      //     style: GoogleFonts.raleway(
                                      //         fontSize: 17,
                                      //         color: Colors.amber[400],
                                      //         fontWeight: FontWeight.w500),
                                      //   ),
                                      // ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: Colors.red,
                                          width: 2,
                                        )),
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            top: 5,
                                            right: 30,
                                            bottom: 20),
                                        child: Text(
                                          '\u{20B9} ' + tx.amount.toString(),
                                          style: GoogleFonts.raleway(
                                              fontSize: 19,
                                              color: Colors.deepOrange[500],
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 0,
                                            top: 10,
                                            right: 10,
                                            bottom: 10),
                                        child: Text(
                                          tx.title,
                                          style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.amber[400],
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            top: 5,
                                            right: 10,
                                            bottom: 20),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy hh:mm a ')
                                              .format(tx.dateTime),
                                          style: GoogleFonts.raleway(
                                              fontSize: 17,
                                              color: Colors.limeAccent[400],
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow, minimumSize: Size(410, 50)),
                      onPressed: () => this.openText = true,
                      child: Text(
                        'ADD NEW EXPENSES',
                        style: GoogleFonts.raleway(
                          fontSize: 30,
                          color: Colors.blueGrey[900],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
