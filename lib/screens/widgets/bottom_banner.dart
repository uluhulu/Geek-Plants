import 'package:flutter/material.dart';
import 'package:geek_plants/screens/main_screen/main_screen.dart';

class BottomBanner extends StatelessWidget {
  final Function chosePlants;

  const BottomBanner({Key key, this.chosePlants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 71,
        width: 375,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Добавлено: 0 растений',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.5),
                      child: Text(
                        'Пропустить',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.5),
                      child: Image.asset("assets/vector/vector136.png",height: 15,),
                    )

                  ]),
                ),
              )
            ],
          ),
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}
