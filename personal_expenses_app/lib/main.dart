import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void yay() {
    print('hellow');
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
          style: TextStyle(
              fontSize: 30,
              color: Colors.yellow[500],
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 660),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(410, 50), primary: Colors.yellow),
                      onPressed: yay,
                      child: Text(
                        'ADD NEW EXPENSES',
                        style: TextStyle(
                            fontSize: 30, color: Colors.blueGrey[900]),
                        textAlign: TextAlign.center,
                      )))
            ],
          )
        ],
      ),
    ));
  }
}
