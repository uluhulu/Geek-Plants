import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String info;

  InfoCard({
    @required this.title,
    @required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 23,
        bottom: 18,
        left: 18,
        right: 18,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            info,
            style: Theme.of(context).textTheme.body2,
          ),
        ],
      ),
    );
  }
}
