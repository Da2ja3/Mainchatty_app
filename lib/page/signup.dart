
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/accountsuccessful.dart';
import 'loginpage.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  bool _visible = false;
  bool _checked = false;
  bool isLoading = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''
  Password must be at least 8 characters,
  include an uppercase letter, number and symbol.
  ''';

    return null;
  }
  String? validateName(String? formName) {
    if (formName == null || formName.isEmpty)
      return 'Name is required.';


    return null;
  }
  String? validatePhone(String? formPone) {
    if (formPone == null || formPone.isEmpty)
      return 'Pone is required.';


    return null;
  }
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.only(left: 19, right: 21),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          SizedBox(height: 100),
          Center(
            child: Text(
                'Welcome User',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontFamily: 'Lato',
                ),
            ),
          ),

              SizedBox(height: 50),
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontFamily: 'Lato',
            ),
          ),
              SizedBox(height: 50),
          Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontFamily: 'Lato',
                  ),
                ),
                SizedBox(height: 10, width: 374),
                TextFormField(
                  validator: validateName,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Username ',
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontFamily: 'Lato',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: validateEmail,
                  controller:_email,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Email Address ',
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                    fontFamily: 'Lato',
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: validatePassword,
                  controller:_password,
                  obscureText: _visible,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password ',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontFamily: 'Lato',
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                        icon: _visible
                            ? Icon(
                          Icons.visibility,
                        )
                            : Icon(
                          Icons.visibility_off,
                        ),
                      )),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24.0),
                  child: GestureDetector(
                    onTap: () {
                      if(_formkey.currentState!.validate()){
                        isLoading = true;
                      setState(() {});
                      Future.delayed(Duration(seconds: 5)).then((value) {
                        isLoading = false;
                        setState((){
                          FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text.trim(), password: _password.text);});
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => AccSuccessful()));
                      });
                    }
                    },
                    child: Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: isLoading == false
                          ? Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              SizedBox(width: 5),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ))),
            ],
          )),
        ]),
      ),
    )));
  }
}
