import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUsers extends StatelessWidget {
  const ChatUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('SeniorDev Group',
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: Icon(Icons.tag_faces,
                  color: Colors.green,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Message',
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: 'Lato',
                ),
              ),
            ),
        ],
      ),
      );
  }
}
