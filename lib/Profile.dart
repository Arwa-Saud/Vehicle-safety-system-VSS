import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

@override
  void initState() {
    super.initState();
    getCurrentUser();
  }

void getCurrentUser(){
  try{
    final user = _auth.currentUser;
  if (user != null) {
    signedInUser = user;
    print(signedInUser.email);
    }
  } catch (e){
    print(e);
  }
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
          title: Text('Profile'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://www.nicepng.com/png/detail/301-3012711_png-file-profile-white-icon-png.png'),
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 38.0,
                  color: Color.fromARGB(255, 55, 54, 54),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black12,
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 20.0),
                color: Colors.black,
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.black,
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 24.0,
                      ),
                      label: Text('logout'),
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
