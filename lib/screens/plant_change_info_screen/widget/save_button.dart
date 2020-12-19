import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286,
      height: 51,
      child: RaisedButton(
        color: Colors.black,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(),
        child: Text(
          "Сохранить",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
