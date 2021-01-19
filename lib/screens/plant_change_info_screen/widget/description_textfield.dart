import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget{
  final String description;
  final Function(String name) onChanged;

  const DescriptionTextField({
    Key key,
    this.description,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        autofocus: false,
        onChanged: onChanged,
        maxLines: 6,
        controller: TextEditingController(text: description),
        decoration: InputDecoration(
          labelText: "Описание",
          labelStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}