import 'package:flutter/material.dart';
import 'package:tjl_app/screens/widgets/my_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

// This class holds data related to the Register form.
class RegisterFormState extends State<RegisterForm> {
  final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final _formKey = GlobalKey<FormState>();

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    hintText: "Name",
                    obscureText: false,
                    icon: Icons.person_add_alt_1_outlined,
                    iconColor: Colors.white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is empty';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    icon: Icons.person_add_alt_1_outlined,
                    iconColor: Colors.white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    icon: Icons.person_add_alt_1_outlined,
                    iconColor: Colors.white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                height: 60,
                width: 200,
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.amber.shade600,
                      side: BorderSide(
                          color: Colors.amber.shade600,
                          width: 1,
                          style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontFamily: 'NeutralFace',
                        fontSize: 10,
                        letterSpacing: 5),
                  ),
                  onPressed: () {
                    // Validate returns true if form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If form is valid display Logging you in... Snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Getting you registered...'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
