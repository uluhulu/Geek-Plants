import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isSelected;

  Indicator({
    @required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.green : Colors.black,
          width: 1,
        ),
      ),
      child: isSelected
          ? Center(
              child: Icon(
                Icons.done,
                color: Colors.green,
              ),
            )
          : null,
    );
  }
}
