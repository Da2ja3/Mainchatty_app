
import 'package:flutter/material.dart';

import '../page/chattyapp.dart';
import 'nav.dart';

class logSuccessful extends StatefulWidget {
  const logSuccessful({super.key});

  @override
  State<logSuccessful> createState() => _logSuccessfulState();
}

class _logSuccessfulState extends State<logSuccessful> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Nav()));
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      const SizedBox(height: 50),
      Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Color(0xff357619),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            'Chatty'
                '\nApp',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      SizedBox(height: 40),
      Center(
        child: Text('Log in Successfully',
            textAlign: TextAlign.center,
            // ignore: unnecessary_const
            style: const TextStyle(
                // fontFamily: 'times new roman',
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xff000000))),
      ),
       SizedBox(height: 50),
      Icon(Icons.mark_chat_read, size: 150, color: Color(0xff357619)),
    ])));
  }
}
