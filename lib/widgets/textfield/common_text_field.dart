import 'package:flutter/material.dart';

class AddTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final int maxLine;
  final ValueChanged<String> onChange;
  final Stream stream;
  final TextInputType keyboardType;
  final String initialValue;
  final int maxCharecters;

  AddTextField(
      {this.label,
        this.maxLine = 1,
        this.onChange,
        this.maxCharecters,
        this.initialValue,
        this.stream,
        this.keyboardType = TextInputType.text,
        this.hintText});

  @override
  _AddTextFieldState createState() => _AddTextFieldState();
}

class _AddTextFieldState extends State<AddTextField> {
  Widget buildTextBox({String data, String error}) {
    bool _validate = false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(data: ThemeData(
        primaryColor: Colors.black,
      ), child: TextField(
        maxLines: widget.maxLine,
        onChanged: widget.onChange,
        maxLength: widget.maxCharecters,
        //controller: _controller,
        textAlign: TextAlign.start,
        keyboardType: widget.keyboardType,
        style: TextStyle(fontSize: 22, color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          errorText: error,
          focusColor: Colors.black,
          labelStyle: TextStyle(
              color: Colors.black,
              decorationColor: Colors.black
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
        ),
      ),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (context, snapshotData) {
          print('Date: ${snapshotData.data}');
          return buildTextBox(data: snapshotData.data, error: snapshotData.error);
        });
  }
}