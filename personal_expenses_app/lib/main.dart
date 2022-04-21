import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/transactionList.dart';
import 'widgets/newTransactions.dart';
import 'widgets/chartBars.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [];
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txInput, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txInput,
      amount: txAmount,
      dateTime: chosenDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _openTheUserInput(BuildContext openContext) {
    showModalBottomSheet(
        context: openContext,
        builder: (openContext) {
          return Container(
            color: Colors.grey[850],
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((transact) => transact.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        body: ListView(children: [
          Column(
            children: [
              Chart(_recentTransactions),
              TransactionList(_userTransaction , _deleteTransaction)
            ],
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Builder(
          builder: (context) => Container(
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, minimumSize: Size(410, 50)),
              child: Text(
                'ADD NEW EXPENSES',
                style: GoogleFonts.raleway(
                  fontSize: 30,
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => _openTheUserInput(context),
            ),
          ),
        ),
      ),
    );
  }
}
