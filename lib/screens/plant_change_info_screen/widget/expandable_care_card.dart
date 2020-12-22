import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:geek_plants/screens/widgets/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:geek_plants/util/time_formatter.dart';


class ExpandableCareCard extends StatefulWidget {
  final String title;
  final String values;

  const ExpandableCareCard({Key key, this.title, this.values,}) : super(key: key);


  

  @override
  State<StatefulWidget> createState() {
    return ExpandableCareCardState();
  }
}

class ExpandableCareCardState extends State<ExpandableCareCard> {
  String selectedValue;
  final calendarController = CalendarController();
  var currentDate = 'test';


  ExpandableController controller = ExpandableController();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.values;
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          controller: controller,
          theme:  ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            iconColor: Colors.black.withOpacity(0.4),
          ),
          header: Padding(
            padding: EdgeInsets.only(
              top: 23,
              bottom: 18,
            ),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                Spacer(),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    selectedValue,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          expanded: Container(
            color: Colors.black,
            height: 522,
            child: Calendar(
              updateDate: (dateTime) async {
                await Future.delayed(Duration(milliseconds: 5));
                setState(() {
                  currentDate = getStringFromDateTime(dateTime);
                });
              },
              onDaySelected: (day, events, holidays) {},
              calendarType: CalendarType.expand,
              calendarController: calendarController,
              // events: widget.eventList,
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
