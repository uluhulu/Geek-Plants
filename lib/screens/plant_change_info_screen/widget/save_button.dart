import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function() onPressed;

  const SaveButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

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
        onPressed: onPressed,
      ),
    );
  }
}
