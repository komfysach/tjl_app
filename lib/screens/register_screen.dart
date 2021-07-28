import 'package:flutter/material.dart';

Widget textField({
  required String hintText,
  required IconData icon,
  required Color iconColor,
}) {
  return TextFormField(
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white, fontFamily: "NeutralFace"),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade600))),
  );
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: TextStyle(
                color: Colors.amber.shade600,
                fontFamily: "Stanley",
                fontSize: 55,
              ),
            ),
            Column(
              children: [
                textField(
                    hintText: "Name",
                    icon: Icons.person,
                    iconColor: Colors.white),
                SizedBox(
                  height: 30,
                ),
                textField(
                    hintText: "Email",
                    icon: Icons.lock_outline,
                    iconColor: Colors.white),
                SizedBox(
                  height: 30,
                ),
                textField(
                    hintText: "Password",
                    icon: Icons.lock_outline,
                    iconColor: Colors.white),
                SizedBox(
                  height: 30,
                ),
                textField(
                    hintText: "Confirm Password",
                    icon: Icons.lock_outline,
                    iconColor: Colors.white),
              ],
            ),
            Container(
              height: 60,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.amber.shade600,
                        side: BorderSide(
                            color: Colors.amber.shade600,
                            width: 1,
                            style: BorderStyle.solid),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: 'NeutralFace',
                          fontSize: 12,
                          letterSpacing: 5),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.amber.shade600,
                        side: BorderSide(
                            color: Colors.white,
                            width: 1,
                            style: BorderStyle.solid),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontFamily: 'NeutralFace',
                          fontSize: 12,
                          letterSpacing: 5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
