import 'package:car_app/Login_Signup_Screens/home.dart';
import 'package:car_app/Login_Signup_Screens/landing_page.dart';
import 'package:car_app/views/bottom_nav_bar.dart';
import 'package:car_app/views/home_sample.dart';
import 'package:car_app/views/home_screen/home_screeen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Bottom_Nav();
            } else {
              return LandingPage1();
            }
          }),
    );
  }
}
