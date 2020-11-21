import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const BlackButton({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 42,
        right: 42,
      ),
      child: Container(
        width: double.infinity,
        height: 51,
        child: RaisedButton(

          color: Colors.white,
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
          child: Text(title),
          onPressed: onTap,
        ),
      ),
    );
  }
}
