import 'package:flutter/material.dart';
import 'package:geek_plants/mocks.dart';

import 'filter_list.dart';

class SearchingAppBar extends StatelessWidget {
  final Function searchItems;
  final Function choseCategory;

  const SearchingAppBar({Key key, this.searchItems, this.choseCategory}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 196.0,
      floating: false,
      pinned: true,
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Text("Добавьте свои растения!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontFamily: 'SFPro')),
            ),
            _buildSearchField(searchItems),
            FilterList(choseCategory: choseCategory),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(Function searchItems){
    return Padding(
      padding:
      const EdgeInsets.only(top: 28, left: 14, right: 14),
      child: TextField(
        onTap: (){
          searchItems();
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
          fillColor: Color.fromRGBO(255, 255, 255, 0.1),
          hintText: 'Поиск',
          hintStyle:
          TextStyle(fontSize: 16.0, color: Colors.white),
          prefixIcon: Padding(
            padding:
            const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
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