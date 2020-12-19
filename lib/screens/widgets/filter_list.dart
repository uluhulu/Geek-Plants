import 'package:flutter/material.dart';
import 'package:geek_plants/values/mocks.dart';

class FilterList extends StatefulWidget {
  final Function(String category) choseCategory;

  const FilterList({Key key, @required this.choseCategory}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FilterListState();
  }
}

class FilterListState extends State<FilterList> {
  var currentCategory = categories[0];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var category in categories)
            GestureDetector(
              onTap: () {
                setState(() {
                  currentCategory = category;
                });
                widget.choseCategory?.call(category);
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  category,
                  style: TextStyle(
                    color: category == currentCategory
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
