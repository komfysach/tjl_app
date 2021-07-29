import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late UserCredential userCredential;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user!.uid)
          .set({
        'name': name.text.trim(),
        'email': email.text.trim(),
        'userId': userCredential.user!.uid,
        'password': password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

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
                      value = name.text.trim();
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return value;
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
                      value = email.text.trim();
                      if (value == null || value.isEmpty) {
                        return 'Email is empty';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return value;
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
                      value = password.text.trim();
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return value;
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
                      value = password.text.trim();
                      if (value == null ||
                          value.isEmpty ||
                          password == password) {
                        return 'Please make sure passwords match';
                      } else {
                        sendData();
                      }
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
