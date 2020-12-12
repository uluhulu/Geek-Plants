import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/model/event.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/mocks.dart';
import 'package:geek_plants/values/strings.dart';

class FlexibleCalendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                events: {
                  DateTime.now(): [
                    Event(
                      type: EventType.watering,
                      plant: plantList[0],
                    ),
                    Event(
                      type: EventType.feeding,
                      plant: plantList[0],
                    ),
                    Event(
                      type: EventType.transfer,
                      plant: plantList[0],
                    ),
                  ]
                },
              ),
            ],
          ),
        ),
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