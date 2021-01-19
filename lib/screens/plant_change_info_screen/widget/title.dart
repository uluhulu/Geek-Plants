import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String name;
  final String latName;

  const TitleWidget({Key key, this.name, this.latName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTitle();
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11.0,bottom: 31.0),
            child: Text(
              latName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
