import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/screens/calendar_day_screen/widget/day_panel.dart';
import 'package:geek_plants/screens/calendar_day_screen/widget/task_item/task_item.dart';
import 'package:geek_plants/values/mocks.dart';
import 'package:geek_plants/values/strings.dart';

class CalendarDayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarDayScreenState();
  }
}

class _CalendarDayScreenState extends State<CalendarDayScreen> {
  final uncompleteTasks = <Event>[
    Event(
      type: EventType.transfer,
      plant: plantList[0],
    ),
    Event(
      type: EventType.feeding,
      plant: plantList[1],
    ),
    Event(
      type: EventType.watering,
      plant: plantList[2],
    ),
  ];

  final completeTasks = <Event>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApppbar(),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          _buildDayPanel(),
          _buildUncompleteTasks(),
          _buildCompleteHeader(),
          _buildCompleteTasks(),
        ],
      ),
    );
  }

  Widget _buildApppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),
      title: Text(taskListTitle),
      centerTitle: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
    );
  }

  Widget _buildDayPanel() {
    return SliverPersistentHeader(
      delegate: DayPanel(taskCount: 5),
      floating: true,
    );
  }

  Widget _buildUncompleteTasks() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return TaskItem(
            onTap: () {
              _addToComplete(index);
            },
            event: uncompleteTasks[index],
            isSelected: false,
          );
        },
        childCount: uncompleteTasks.length,
      ),
    );
  }

  Widget _buildCompleteHeader() {
    if (completeTasks.isNotEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 16),
          child: Text(
            completeTaskHeader,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }
    return SliverToBoxAdapter();
  }

  Widget _buildCompleteTasks() {
    if (completeTasks.isNotEmpty) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return TaskItem(
              onTap: () {
                _removeFromComplete(index);
              },
              event: completeTasks[index],
              isSelected: true,
            );
          },
          childCount: completeTasks.length,
        ),
      );
    }
    return SliverToBoxAdapter();
  }

  void _addToComplete(int index) {
    setState(() {
      completeTasks.add(uncompleteTasks[index]);
      uncompleteTasks.removeAt(index);
    });
  }

  void _removeFromComplete(int index) {
    setState(() {
      uncompleteTasks.add(completeTasks[index]);
      completeTasks.removeAt(index);
    });
  }
}
