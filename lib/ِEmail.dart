import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                child: IconButton(
                    color: Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    icon: Icon(
                      (Icons.arrow_back),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          cursorColor: Color.fromARGB(156, 255, 120, 241),
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: "User Email",
                            border: InputBorder.none,
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () async {
                          myauth.setConfig(
                              appEmail: "me@rohitchouhan.com",
                              appName: "Email OTP",
                              userEmail: email.text,
                              otpLength: 6,
                              otpType: OTPType.digitsOnly);
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        },
                        child: const Text("Send OTP")),
                  ],
                ),
              ),
              Card(
                //elevation: 0,
                //color: Theme.of(context).colorScheme.surfaceVariant,
                //color: Colors.grey,
                //borderOnForeground: mounted,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          cursorColor: Color.fromARGB(156, 255, 120, 241),
                          keyboardType: TextInputType.number,
                          controller: otp,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter OTP",
                            /*fillColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 145, 101, 192)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )*/
                          )),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () async {
                          if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),
                            ));
                            Navigator.pushNamed(context, 'home');
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        },
                        child: const Text("Verify")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
