
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

  elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            'Groups',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
    ));
  }
}
