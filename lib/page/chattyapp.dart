import 'package:flutter/material.dart';
import 'chatusers.dart';
import 'chatusers2.dart';

class ChattyApp extends StatefulWidget {
  const ChattyApp({Key? key}) : super(key: key);

  @override
  State<ChattyApp> createState() => _ChattyAppState();
}

class _ChattyAppState extends State<ChattyApp> {
  // int currentIndex=0;
  // final screens=[
  //   Center(child: Text('Chats', style:TextStyle(fontSize: 50)),),
  // Center(child: Text('Profile', style:const TextStyle(fontSize: 50)),)
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chats",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 2),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Add New",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatUsers()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'SeniorDev Group',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatUsers2()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'JuniorDev Group',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (index)=>setState(()=>currentIndex=index),
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey.shade600,
      //   selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //   unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: ('Chats')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_box), label: ('Profile')),
      //   ],
      // ),
    );
  }
}
