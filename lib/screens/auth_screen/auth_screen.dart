import 'package:flutter/material.dart';
import 'package:geek_plants/screens/searching_screen/searching_screen.dart';
import 'package:geek_plants/screens/widgets/black_button.dart';

import '../../pathStrings.dart';
import '../../strings.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(geekPlantsBannerPath),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 42.0,
              right: 42.0,
            ),
            child: TextField(
              decoration: InputDecoration(hintText: hintEmail),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 43.0,
              left: 42.0,
              right: 42.0,
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: hintPassword),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  forgetPassword,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          _buildLoginButton(),
          FlatButton(
            child: Text(
              register,
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              /** */
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top:33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _signInButton(apple),
                _signInButton(vk),
                _signInButton(google),
                _signInButton(facebook),
              ],

            ),
          )
        ],
      ),
    );
  }

  Widget _signInButton(String iconPath) {
    return IconButton(
      iconSize: 57.0,
      color: Colors.black,
      onPressed: () {  },
      icon: Image.asset(iconPath),
    );
  }

  Widget _buildLoginButton() {
    return Column(
      children: [
        BlackButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchingScreen()),
            );
          },
          title: signIn,
        ),
      ],
    );
  }
}