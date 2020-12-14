import 'package:flutter/material.dart';
import 'package:geek_plants/values/mocks.dart';

class FilterList extends StatelessWidget {
  final Function choseCategory;

  const FilterList({Key key, this.choseCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var category in categories)
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
