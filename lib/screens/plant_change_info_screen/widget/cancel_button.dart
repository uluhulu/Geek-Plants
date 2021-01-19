import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildCancelButton();
  }

  Widget _buildCancelButton(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FlatButton(
        child: Text(
          "Пропустить",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16
          ),
        ),
        onPressed: () {
          /** */
        },
      ),
    );
  }
}