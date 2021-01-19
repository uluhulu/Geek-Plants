import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/pathStrings.dart';
import 'package:geek_plants/values/strings.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildAppBar();
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      centerTitle: false,
      backgroundColor: appBarColor,
      title: _buildAppbarBody(),
      actions: _buildAppbarActions(),
    );
  }

  Widget _buildAppbarBody() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 35,
        bottom: 33,
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(testAvatarPath),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            testUserName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAppbarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.filter_list),
        color: Colors.white,
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.add_alert),
        color: Colors.white,
        onPressed: () {},
      ),
    ];
  }
}
