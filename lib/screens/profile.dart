import 'package:chatty_app/page/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi there',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  FirebaseAuth.instance.signOut().then((value) => 
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context)=>LoginPage())));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Center(
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
