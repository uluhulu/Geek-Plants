import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:geek_plants/screens/widgets/plant_card.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/mocks.dart';
import 'package:geek_plants/values/pathStrings.dart';
import 'package:geek_plants/values/strings.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildFlexibleCalendar(),
          _buildHeader(),
          _buildPlantsList(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.green,
          size: 48,
        ),
        onPressed: () {},
      ),
    );
  }

  var selectedItem = 0;

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          selectedItem = index;
        });
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

  Widget _buildFlexibleCalendar() {
    return SliverPersistentHeader(
      delegate: CalendarHeader(
        Container(
          color: appBarColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              _buildOpenCalendarButton(),
              SizedBox(height: 19),
              Calendar(
                onDaySelected: (day, events, holidays) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 41.0, left: 19),
              child: Text(
                "Мои растения",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11.0, left: 19),
                    child: Text(
                      "3 растения",
                      style: TextStyle(
                        color: Color.fromRGBO(74, 171, 66, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                  width: 136,
                ),
                _buildSquareIcon(),
                _buildSeparator(),
                _buildRectangleIcon(),
                _buildSeparator(),
                _buildSearchingIcon(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOpenCalendarButton() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              openCalendarButton,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.chevron_right,
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildSquareIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Image.asset(
        "assets/vector/square.png",
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _buildRectangleIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Image.asset(
        "assets/vector/rec.png",
        width: 16,
        height: 12,
      ),
    );
  }

  Widget _buildSearchingIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Image.asset(
        "assets/vector/search.png",
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
      child: Image.asset(
        "assets/vector/separator.png",
        height: 24,
        width: 2,
      ),
    );
  }

  Widget _buildPlantsList() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PlantCardMainScreen(
            plant: plantList[index],
          );
        },
        childCount: 3,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 0,
      ),
    );
  }
}

class CalendarHeader extends SliverPersistentHeaderDelegate {
  final Widget calendarHeader;

  CalendarHeader(this.calendarHeader);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return calendarHeader;
  }

  @override
  double get maxExtent => 160;

  @override
  double get minExtent => 160;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
