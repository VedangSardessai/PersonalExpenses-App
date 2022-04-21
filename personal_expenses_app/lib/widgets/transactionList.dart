import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final deleteTx;
  @override
  TransactionList(this.transaction , this.deleteTx);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 5),
      width: double.infinity,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  "\n\nNo transactions added till now!\n\n",
                  style: GoogleFonts.raleway(
                      fontSize: 22,
                      color: Colors.amber[400],
                      fontWeight: FontWeight.bold),
                ),
                Image.network(
                  'https://cdn.pixabay.com/photo/2012/04/01/17/34/register-23666_960_720.png',
                  height: 300,
                  width: 300,
                ),
              ],
            )
          : Column(
              children: transaction.map((tx) {
                return Card(
                  color: Colors.grey[800],
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            margin: EdgeInsets.only(
                                left: 10, top: 5, right: 10, bottom: 20),
                            child: Text(
                              '\u{20B9} ' + tx.amount.toStringAsFixed(2),
                              style: GoogleFonts.raleway(
                                  fontSize: 19,
                                  color: Colors.deepOrange[500],
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 0),
                              child: IconButton(
                                onPressed: () => deleteTx(tx.id),
                                icon: Icon(Icons.delete),
                                color: Colors.yellow,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 5, top: 10, right: 10, bottom: 10),
                            child: Expanded(
                              child: Text(
                                tx.title,
                                style: GoogleFonts.raleway(
                                    fontSize: 15,
                                    color: Colors.amber[400],
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 5, right: 10, bottom: 20),
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
                  ),
                );
              }).toList(),
            ),
    );
  }
}
