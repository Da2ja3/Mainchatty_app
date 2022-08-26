
import 'package:chatty_app/page/loginpage.dart';
import 'package:flutter/material.dart';

import '../page/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'ChattyApp',
            style: TextStyle(color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}