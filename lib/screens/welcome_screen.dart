import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  Widget button({
    required String name,
    required Color color,
  }) {
    return Container(
      height: 60,
      width: 200,
      child: TextButton(
        style: TextButton.styleFrom(
            primary: color,
            side: BorderSide(color: color, width: 1, style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(fontFamily: 'SourceCodePro'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: 'Stanley',
                      fontSize: 40,
                      color: Colors.amber.shade600,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(20)),
                      Text(
                        "Order food at our restaurant and",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'SourceCodePro'),
                      ),
                      Text(
                        "make a booking with ease",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'SourceCodePro'),
                      ),
                    ],
                  ),
                  button(name: "Login", color: Colors.amber.shade600),
                  button(name: "Register", color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
