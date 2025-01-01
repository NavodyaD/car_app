import 'package:car_app/Login_Signup_Screens/button1.dart';
import 'package:car_app/Login_Signup_Screens/login1.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/enter_phone_number.dart';

import 'package:flutter/material.dart';
import 'splash.dart';

class LandingPage1 extends StatefulWidget {
  const LandingPage1({Key? key}) : super(key: key);

  @override
  State<LandingPage1> createState() => _LandingPage1State();
}

class _LandingPage1State extends State<LandingPage1> {
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Image.asset(
                "lib/assets/1/ellipse1.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),

          Center(
              child: Hero(
            tag: 'logo1',
            child: Image.asset(
              "lib/assets/1/car1.png",
            ),
          )),

          Container(
            padding: EdgeInsets.only(
              top: 75,
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "LOGO",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua. ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: 100,
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                //Get Started Button
                GestureDetector(
                    onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Enter_Phone_Number(),
                          ),
                        ),
                    child: const Button1(buttonText: "Get Started"))
              ],
            ),
          )
          // Image.asset(
          //   "images/sun.jpg",
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          // Container(
          //   color: Colors.black.withOpacity(0.99),
          //   height: 200,
          //   width: 100,
          // )
        ],
      ),
    );
  }
}
