import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/data/model/event_old.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/plant_change_info_screen/widget/expandable_care_card/expandable_care_card_viewmodel.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:geek_plants/util/time_formatter.dart';

class ExpandableCareCard extends StatefulWidget {
  final String title;
  final String plantName;
  final String photoPath;
  final int plantId;
  final Function(List<Event> event) onDaySelected;
  final List<Event> events;
  final EventType eventType;

  ExpandableCareCard({
    Key key,
    this.title,
    this.onDaySelected,
    this.events,
    this.eventType,
    this.plantName,
    this.photoPath,
    this.plantId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpandableCareCardState();
  }
}

class ExpandableCareCardState extends State<ExpandableCareCard> {
  final calendarController = CalendarController();
  var currentDate = 'test';

  ExpandableController controller = ExpandableController();

  ExpandableCareCardViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ExpandableCareCardViewModel(
      widget.events,
      widget.eventType,
      widget.plantName,
      widget.photoPath,
      widget.plantId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          controller: controller,
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            iconColor: Colors.black.withOpacity(0.4),
          ),
          header: Padding(
            padding: EdgeInsets.only(
              top: 23,
              bottom: 18,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ),
          expanded: Container(
            color: Colors.white,
            height: 522,
            child: StreamBuilder<Map<DateTime, List<Event>>>(
              initialData: {},
              stream: viewModel.plantEvents.stream,
              builder: (context, data) {
                return Calendar(
                  updateDate: (dateTime) async {
                    await Future.delayed(Duration(milliseconds: 5));
                    setState(() {
                      currentDate = getStringFromDateTime(dateTime);
                    });
                  },
                  onDaySelected: (day, events, holidays) {
                    viewModel.handlePlantEvents(
                      day,
                      widget.eventType,
                      widget.photoPath,
                    );
                    widget.onDaySelected(viewModel.events);
                  },
                  calendarType: CalendarType.expand,
                  calendarController: calendarController,
                  events: data.data,
                  weekDayColor: Colors.black,
                  todayColor: Colors.green.shade50,
                );
              },
            ),
          ),
          builder: (_, collapsed, expanded) {
            return Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 5,
                top: 5,
              ),
              child: Expandable(
                collapsed: collapsed,
                expanded: expanded,
                theme: const ExpandableThemeData(crossFadePoint: 0),
              ),
            );
          },
        ),
      ),
    );
  }
}
