import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableCharCard extends StatefulWidget {
  final String title;
  final String initialValue;
  final List<String> values;
  final Function(String selectedValue) onSelect;

  const ExpandableCharCard({
    Key key,
    this.title,
    this.values,
    this.onSelect,
    this.initialValue,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExpandableCharCardState();
  }
}

class ExpandableCharCardState extends State<ExpandableCharCard> {
  String selectedValue;

  ExpandableController controller = ExpandableController();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
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
            height: 100,
            child: CupertinoPicker(
              itemExtent: 30,
              onSelectedItemChanged: (int value) {
                setState(() {
                  selectedValue = widget.values[value];
                });

                widget.onSelect(selectedValue);
              },
              children: widget.values.map<Widget>((e) => Text(e)).toList(),
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
