import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/screens/calendar_day_screen/widget/task_item/indicator.dart';
import 'package:geek_plants/screens/widgets/event_builder.dart';
import 'package:geek_plants/values/colors.dart';

class TaskItem extends StatefulWidget {
  final Event event;
  final Function() onTap;
  final bool isSelected;

  TaskItem({
    @required this.event,
    @required this.onTap,
    @required this.isSelected,
  });

  @override
  State<StatefulWidget> createState() {
    return TaskItemState();
  }
}

class TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20,
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Ink(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 8),
              _buildPlantImageEvent(),
              SizedBox(width: 12),
              _buildTitle(),
              Spacer(),
              Indicator(isSelected: widget.isSelected),
              SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantImageEvent() {
    return Stack(
      children: [
        _buildPlantImage(),
        _buildPlantEvent(),
      ],
    );
  }

  Widget _buildPlantImage() {
    return Container(
      width: 58,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(widget.event.plant.photoPath),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlantEvent() {
    return Positioned(
      right: -5,
      bottom: 10,
      width: 35,
      height: 24,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(0.2)),
          ],
        ),
        child: Center(
          child: buildCalendarEvent(widget.event),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      constraints: BoxConstraints(maxWidth: 188),
      child: Text(
        "${eventTypeMapper(widget.event.type)} ${widget.event.plant.name}",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: taskItemTitleColor,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
