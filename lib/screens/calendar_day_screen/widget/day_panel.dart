import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/values/colors.dart';
import 'package:geek_plants/values/strings.dart';

class DayPanel extends SliverPersistentHeaderDelegate {
  final int taskCount;

  DayPanel({
    @required this.taskCount,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          _buildDayBlock(),
          SizedBox(
            width: 16,
          ),
          _buildTaskBlock(),
        ],
      ),
    );
  }

  Widget _buildDayBlock() {
    return Container(
      width: 99,
      height: 108,
      color: dayBlocColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateTime.now().day.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          Text(
            'мая',
            style: TextStyle(
              color: Colors.white.withOpacity(0.3),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          uncompleteTasks,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          '$taskRemaining $taskCount',
          style: TextStyle(
            color: uncompleteTaskColor.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 108;

  @override
  // TODO: implement minExtent
  double get minExtent => 108;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
