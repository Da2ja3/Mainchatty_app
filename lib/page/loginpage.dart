
import 'package:chatty_app/page/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/loginsuccessful.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _visible = false;
  bool _checked = false;
  bool isLoading = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formkey= GlobalKey<FormState>();

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';


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
              children: [
                SizedBox(height: 100),
                Center(
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                SizedBox(height: 50),
         Form(
           key: _formkey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
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
                 controller: _email,
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
                 validator:validatePassword,
                 controller: _password,
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
                     if(_formkey.currentState!.validate()) {
                       isLoading = true;
                       setState(() {});
                       Future.delayed(Duration(seconds: 5)).then((value) {
                         isLoading = false;
                         setState(() {});
                         Future.delayed(Duration(seconds: 5)).then((value) {
                           isLoading = false;
                           setState(() {
                             FirebaseAuth.instance.signInWithEmailAndPassword(
                                 email: _email.text.trim(),
                                 password: _password.text);
                           });
                           Navigator.pushReplacement(context,
                               MaterialPageRoute(
                                   builder: (context) => logSuccessful()));
                         });
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
                         'Log In',
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
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>SignUp()));
                  },
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
