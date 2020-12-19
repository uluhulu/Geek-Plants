import 'package:flutter/material.dart';
import 'package:geek_plants/values/mocks.dart';

import '../../widgets/filter_list.dart';

class SearchingAppBar extends StatelessWidget {
  final Function(String name) searchItems;
  final Function(String category) choseCategory;

  SearchingAppBar({
    Key key,
    @required this.searchItems,
    this.choseCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 196.0,
      floating: true,
      pinned: false,
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: <Widget>[
            _buildAppBarText(),
            _buildSearchField(context),
            FilterList(choseCategory: choseCategory),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarText() {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Text(
        "Добавьте свои растения!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontFamily: 'SFPro',
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 28,
        left: 14,
        right: 14,
      ),
      child: TextField(
        onChanged: searchItems,
        onSubmitted: (text) {
          FocusScope.of(context).unfocus();
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(32.0),
            ),
          ),
          filled: true,
          fillColor: Color.fromRGBO(
            255,
            255,
            255,
            0.1,
          ),
          hintText: 'Поиск',
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(
              9.0,
              6.0,
              9.0,
              6.0,
            ),
            child: Icon(
              Icons.search,
              color: Color(0xffC4C6CC),
            ),
          ),
        ),
        style: TextStyle(
          color: Color(0xffC4C6CC),
          fontSize: 14.0,
          fontFamily: 'Brutal',
        ),
      ),
    );
  }
}
