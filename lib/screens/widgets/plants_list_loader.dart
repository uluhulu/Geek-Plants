import 'package:flutter/cupertino.dart';

class PlantsListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: CupertinoActivityIndicator(
          radius: 16,
        ),
      ),
    );
  }
}
