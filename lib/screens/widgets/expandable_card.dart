import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  final String title;
  final String info;

  ExpandableCard({
    @required this.title,
    @required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
          ),
          header: Padding(
            padding: EdgeInsets.only(
              top: 23,
              bottom: 18,
              left: 18,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          expanded: Text(
            info,
            style: Theme.of(context).textTheme.body2,
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
