import 'package:flutter/material.dart';
import 'package:geek_plants/screens/widgets/black_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('ЛБ1, Сысоева Ульяна'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/geek-plants-banner.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 42.0,
              right: 42.0,
            ),
            child: TextField(
              // decoration: BoxDecoration(
              //   border:
              // ) ,
              decoration: InputDecoration(hintText: 'E-mail'),
              obscureText: true,
              // placeholder: "E-mail",
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
              decoration: InputDecoration(hintText: 'Пароль'),
              // placeholder: "Пароль",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Забыли пароль?',
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
              'Зарегистрироваться',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {
              /** */
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _signInButton("assets/icons/apple.png"),
              _signInButton("assets/icons/vk.png"),
              _signInButton("assets/icons/google.png"),
              _signInButton("assets/icons/facebook.png"),
            ],

          )
        ],
      ),
    );
  }

  Widget _signInButton(String iconPath) {
    return Padding(
      padding: const EdgeInsets.only(left: 44.0, top: 33.0),
      child: IconButton(
        padding: EdgeInsets.all(0.0),
        iconSize: 51.0,
        color: Colors.black,
        onPressed: () {  },
        icon: Image.asset(iconPath),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Column(
      children: [
        BlackButton(
          onTap: () {},
          title: 'Войти',
        ),
      ],
    );
  }
}