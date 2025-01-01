import 'package:car_app/Login_Signup_Screens/google_auth_service.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/enter_phone_number.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/name_country_page.dart';
import 'package:car_app/Login_Signup_Screens/user_check.dart';
import 'package:car_app/views/bottom_nav_bar.dart';
import 'package:car_app/views/brand_categories.dart';
import 'package:car_app/views/car_brands_page.dart';
import 'package:car_app/views/car_detail_screen/car_details_screen.dart';
import 'package:car_app/views/car_details.dart';
import 'package:car_app/views/gallery_page.dart';
import 'package:car_app/views/home_sample.dart';
import 'package:car_app/views/home_screen/home_screeen.dart';
import 'package:car_app/views/news_page.dart';
import 'package:car_app/views/news_screen.dart';
import 'package:car_app/views/photo_scroll.dart';
import 'package:car_app/views/pick_your_car_screen/pick_your_car_screen.dart';
import 'package:car_app/views/read_about_screen/read_about_screen.dart';
import 'package:car_app/views/your_car.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuthState(),
    );
  }
}


// Run AuthService().handleAuthState()

