import 'package:car_app/Login_Signup_Screens/landing_page.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/enter_phone_number.dart';
import 'package:car_app/Login_Signup_Screens/starting_page.dart';
import 'package:car_app/views/bottom_nav_bar.dart';
import 'package:car_app/views/home_screen/home_screeen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Bottom_Nav();
          } else {
            return LandingPage1();
          }
        });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() => handleAuthState());
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
