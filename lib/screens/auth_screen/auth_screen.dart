import 'package:flutter/material.dart';
import 'package:geek_plants/screens/all_plants_screen/all_plants_screen.dart';
import 'package:geek_plants/screens/widgets/black_button.dart';
import 'package:geek_plants/values/pathStrings.dart';

import '../../values/strings.dart';

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
          _buildBanner(),
          _buildEmailBanner(),
          _buildPasswordBanner(),
          _buildForgetPasswordButton(),
          _buildLoginButton(),
          _buildRegisterButton(),
          Padding(
            padding: const EdgeInsets.only(top: 33),
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

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(geekPlantsBannerPath),
    );
  }

  Widget _buildEmailBanner() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 42.0,
        right: 42.0,
      ),
      child: TextField(
        decoration: InputDecoration(hintText: hintEmail),
      ),
    );
  }

  Widget _buildPasswordBanner() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 43.0,
        left: 42.0,
        right: 42.0,
      ),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(hintText: hintPassword),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Padding(
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
    );
  }

  Widget _buildRegisterButton() {
    return FlatButton(
      child: Text(
        register,
        style: TextStyle(
          color: Colors.green,
        ),
      ),
      onPressed: () {
        /** */
      },
    );
  }

  Widget _signInButton(String iconPath) {
    return IconButton(
      iconSize: 57.0,
      color: Colors.black,
      onPressed: () {},
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
              MaterialPageRoute(builder: (context) => AllPlantsScreen()),
            );
          },
          title: signIn,
        ),
      ],
    );
  }
}
