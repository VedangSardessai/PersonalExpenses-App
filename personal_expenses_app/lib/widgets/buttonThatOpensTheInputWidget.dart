import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewExpenses extends StatelessWidget {
  final Function forOnPressed;
  @override
  AddNewExpenses(this.forOnPressed);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.yellow, minimumSize: Size(410, 50)),
        onPressed: () => forOnPressed,
        child: Text(
          'ADD NEW EXPENSES',
          style: GoogleFonts.raleway(
            fontSize: 30,
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
