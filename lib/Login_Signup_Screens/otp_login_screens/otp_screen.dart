import 'package:car_app/Login_Signup_Screens/button1.dart';
import 'package:car_app/Login_Signup_Screens/google_auth_service.dart';
import 'package:car_app/Login_Signup_Screens/home.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/name_country_page.dart';
import 'package:car_app/Login_Signup_Screens/signup.dart';
import 'package:car_app/Login_Signup_Screens/starting_page.dart';
import 'package:car_app/views/bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:pinput/pinput.dart';

class OTP_Screen extends StatefulWidget {
  final String phone;
  final String dropdownvalue;

  OTP_Screen(this.dropdownvalue, this.phone);

  @override
  _OTP_ScreenState createState() => _OTP_ScreenState(phone);
}

class _OTP_ScreenState extends State<OTP_Screen> {
  _OTP_ScreenState(this.phone);

  final String phone;

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  OtpFieldController otpController = OtpFieldController();
  //var otpController = List.generate(6, (index) => null);

  String errorMessage = '';

  goHome() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Bottom_Nav(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Future signIn() async {
  //   await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(
  //           email: _emailController.text.trim(),
  //           password: _passwordController.text.trim())
  //       .whenComplete(() => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomePage1())))
  //       .catchError((e) => print(e));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        late final maxHeight;
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          maxHeight = constraints.maxHeight;
        } else {
          maxHeight = constraints.maxHeight * 1.5;
        }
        return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: 'ellipse2',
                          child: Image.asset(
                            "lib/assets/1/ellipse2.png",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 100,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Hero(
                                tag: 'car2',
                                child: Image.asset(
                                  "lib/assets/1/car2.png",
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 30, top: 50),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                              SizedBox(
                                height: 260,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 25, right: 25),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Pinput(
                                        length: 6,
                                        defaultPinTheme: defaultPinTheme,
                                        controller: _pinPutController,
                                        onSubmitted: (pin) async {
                                          try {
                                            await FirebaseAuth.instance
                                                .signInWithCredential(
                                                    PhoneAuthProvider.credential(
                                                        verificationId:
                                                            _verificationCode!,
                                                        smsCode: pin))
                                                .then((value) async {
                                              if (value.user != null) {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            NameCountryPage(
                                                              phoneNumber:
                                                                  phone,
                                                            )),
                                                    (route) => false);
                                              }
                                            });
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content:
                                                        Text(e.toString())));
                                          }
                                        },
                                      ),
                                    ),
                                    Text(
                                      errorMessage,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 219, 36, 23)),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // If the form is valid, display a snackbar. In the real world,
                                            // you'd often call a server or save the information in a database.
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Processing Data')),
                                            );

                                            // try {
                                            //   await FirebaseAuth.instance
                                            //       .signInWithEmailAndPassword(
                                            //           email: _emailController
                                            //               .text
                                            //               .trim(),
                                            //           password:
                                            //               _passwordController
                                            //                   .text
                                            //                   .trim())
                                            //       .then((value) => goHome());

                                            //   errorMessage = '';
                                            // } on FirebaseAuthException catch (error) {
                                            //   errorMessage = error.message!;
                                            // }

                                            // setState(() {});

                                            //signIn();

                                            // Navigate Sign Up Page

                                          }
                                        },
                                        child: Button2(buttonText: "Sign In")),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: Container(
                                            color: Colors.black38,
                                            height: 1,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Flexible(
                                            flex: 3,
                                            child: Text(
                                              '    or    ',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black54),
                                            )),
                                        Flexible(
                                          flex: 4,
                                          child: Container(
                                            color: Colors.black38,
                                            height: 1,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AuthService().signInWithGoogle();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 11,
                                            bottom: 11),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(13)),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 0, 36, 105))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: 25,
                                                width: 25,
                                                child: Image.network(
                                                    'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png')),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Continue with Google',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 0, 36, 105)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AuthService().signInWithGoogle();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 11,
                                            bottom: 11),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(13)),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 0, 36, 105))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: 25,
                                                width: 25,
                                                child: Image.network(
                                                    'https://www.quinneysbush.co.nz/wp-content/uploads/2021/04/cropped-Facebook-logo.png')),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Continue with Facebook',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 0, 36, 105)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AuthService().signInWithGoogle();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 11,
                                            bottom: 11),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(13)),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromARGB(
                                                    255, 0, 36, 105))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: 25,
                                                width: 25,
                                                child: Image.network(
                                                    'https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-logo-vector-png-clipart-1.png')),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Continue with Twitter',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 0, 36, 105)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )));
      }),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.dropdownvalue}${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StartingPage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
