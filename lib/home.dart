import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyApp1State createState() => _MyApp1State();
}

// ignore: unused_element
class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: Text('vs_sensorApp'), backgroundColor: Colors.black),
        body: Center(
          child: Image(
            image: AssetImage('assets/lugo.jpeg'),
          ),
        ),
        drawer: Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text('vs_sensorApp'),
                ),
                ListTile(
                  title: Text('profile'),
                  onTap: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
