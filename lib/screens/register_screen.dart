import 'package:flutter/material.dart';
import 'package:tjl_app/screens/widgets/my_text_field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation() {
    Validator(),
  }

  Widget button({
    required String name,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      height: 60,
      width: 200,
      child: TextButton(
        style: TextButton.styleFrom(
            primary: textColor,
            side: BorderSide(color: color, width: 1, style: BorderStyle.solid),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          name,
          style: TextStyle(
              fontFamily: 'NeutralFace', fontSize: 10, letterSpacing: 5),
        ),
        onPressed:() {
          // Validate returns true if form is valid, or false otherwise.
          if (_formKey.)
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
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
                MyTextField(
                  hintText: "Name",
                  obscureText: false,
                  icon: Icons.person_add_alt_1_outlined,
                  iconColor: Colors.white,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in your name'),),);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  icon: Icons.mail_outline,
                  iconColor: Colors.white,
                  controller: email,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  icon: Icons.lock_outline,
                  iconColor: Colors.white,
                  controller: password,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  icon: Icons.lock_outline,
                  iconColor: Colors.white,
                  controller: confirmPassword,
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(
                    ontap: () {
                      validation();
                    },
                    name: "Register",
                    color: Colors.amber.shade600,
                    textColor: Colors.amber.shade600,
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
