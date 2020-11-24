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
          _buildPlantsList(),
        ],
      ),
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

  Widget _buildOpenCalendarButton() {
    return InkWell(
      onTap: (){},
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
          SizedBox(width: 8,),
          Icon(
            Icons.chevron_right,
            size: 32,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildPlantsList() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PlantCard(
            plant: plantList[index],
          );
        },
        childCount: plantList.length,
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
