import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/di.dart';
import 'package:geek_plants/screens/calendar_day_screen/calendar_day_viewmodel.dart';
import 'package:geek_plants/screens/calendar_day_screen/widget/day_panel.dart';
import 'package:geek_plants/screens/calendar_day_screen/widget/task_item/task_item.dart';
import 'package:geek_plants/values/mocks.dart';
import 'package:geek_plants/values/strings.dart';

class CalendarDayScreen extends StatefulWidget {
  final DateTime day;

  const CalendarDayScreen({
    Key key,
    this.day,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CalendarDayScreenState();
  }
}

class _CalendarDayScreenState extends State<CalendarDayScreen> {
  CalendarDayViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel =
        CalendarDayViewModel(plantsInteractor, calendarInteractor, widget.day);
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApppbar(),
      body: StreamBuilder<List<Event>>(
          stream: viewModel.tasks.stream,
          builder: (context, snapshot) {
            var taskList = snapshot.data ?? [];
            var completeTasks =
                taskList.where((element) => element.isDone).toList();
            var uncompleteTasks =
                taskList.where((element) => !element.isDone).toList();
            return CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                _buildDayPanel(uncompleteTasks),
                _buildUncompleteTasks(uncompleteTasks),
                _buildCompleteHeader(completeTasks),
                _buildCompleteTasks(completeTasks),
              ],
            );
          }),
    );
  }

  Widget _buildApppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(taskListTitle),
      centerTitle: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
    );
  }

  Widget _buildDayPanel(List<Event> uncompleteTasks) {
    return SliverPersistentHeader(
      delegate: DayPanel(
        taskCount: uncompleteTasks.length,
        day: widget.day,
      ),
      floating: true,
    );
  }

  Widget _buildUncompleteTasks(List<Event> uncompleteTasks) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return TaskItem(
            onTap: () {
              viewModel.addToComplete(uncompleteTasks[index]);
            },
            event: uncompleteTasks[index],
            isSelected: false,
          );
        },
        childCount: uncompleteTasks.length,
      ),
    );
  }

  Widget _buildCompleteHeader(List<Event> completeTasks) {
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

  Widget _buildCompleteTasks(List<Event> completeTasks) {
    if (completeTasks.isNotEmpty) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return TaskItem(
              onTap: () {
                viewModel.removeFromComplete(completeTasks[index]);
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
}
