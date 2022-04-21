import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();

  final _amountInput = TextEditingController();
  final List<Transaction> _userTransaction = [];
  DateTime? _selectDate;

  void submitData() {
    final enteredTitle = _titleInput.text;
    final enteredAmount = double.parse(_amountInput.text);


    if(_amountInput.text.isEmpty ||enteredTitle.isEmpty || enteredAmount <=0 || _selectDate == null )
      return;

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      _selectDate
    );
  }

  void _presentDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 12, top: 10, bottom: 50),
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
                controller: _titleInput,
                onSubmitted: (_) => submitData(),
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
                keyboardType: TextInputType.number,

                controller: _amountInput,
                onSubmitted: (_) => submitData(),

                style: GoogleFonts.raleway(
                    fontSize: 19,
                    color: Colors.yellow[500],
                    fontWeight: FontWeight.w500),
                // onChanged: (value) => amountInput = value,
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
                    labelText: 'How much did it cost you ?'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? 'No date chosen!'
                            : 'Picked Date : ' +
                                DateFormat('dd-MM-yyyy').format(_selectDate!),
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                        ),
                        onPressed: _presentDate,
                        child: Text(
                          'Choose date',
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: submitData,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow, minimumSize: Size(100, 40)),
                  child: Text(
                    'Add your expense',
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
        ),
      ),
    );
  }
}
