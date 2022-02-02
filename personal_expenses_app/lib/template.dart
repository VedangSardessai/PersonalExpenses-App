import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void yay() {
    print('Expense Added!!');
  }

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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: double.infinity,
            height: 250,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 220,
                      child: Card(
                        child: Text(
                          'Sunday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 220,
                      child: Card(
                        child: Text(
                          'Monday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 220,
                      child: Card(
                        child: Text(
                          'Tuesday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 220,
                      child: Card(
                        child: Text(
                          'Wednesday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 220,
                      child: Card(
                        child: Text(
                          'Thursday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 220,
                      child: Card(
                        child: Text(
                          'Friday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 220,
                      child: Card(
                        child: Text(
                          'Saturday',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow, minimumSize: Size(410, 50)),
                        onPressed: yay,
                        child: Text(
                          'ADD NEW EXPENSES',
                          style: GoogleFonts.raleway(
                            fontSize: 30,
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.w500,
                          ),
                          // style: TextStyle(
                          //     fontSize: 30, color: Colors.blueGrey[900]),
                          textAlign: TextAlign.center,
                        ))),
              )
            ],
          ),
          Card(
              child: Text(
            'This is where the list of expenses will be',
            style: TextStyle(fontSize: 25),
          ))
        ],
      ),
    ));
  }
}
