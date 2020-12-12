import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/values/pathStrings.dart';

class BottomMenu extends StatelessWidget {
  var selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        selectedItem = index;
      },
      currentIndex: selectedItem,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text(
            'Поиск',
            style: TextStyle(color: Colors.black45),
          ),
          icon: Image.asset(
            searchIcon,
            width: 20,
            height: 20,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble_outline,
            color: Colors.black45,
          ),
          title: Text(
            'Форум',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.filter_vintage,
            color: Colors.black45,
          ),
          title: Text(
            'Мои растения',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_outline,
            color: Colors.black45,
          ),
          title: Text(
            'Друзья',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.black45,
          ),
          title: Text(
            'Избранное',
            style: TextStyle(color: Colors.black45),
          ),
        ),
      ],
    );
  }
}
