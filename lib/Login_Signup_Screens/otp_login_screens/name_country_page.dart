import 'package:car_app/Login_Signup_Screens/button1.dart';
import 'package:car_app/Login_Signup_Screens/google_auth_service.dart';
import 'package:car_app/Login_Signup_Screens/home.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/otp_screen.dart';
import 'package:car_app/Login_Signup_Screens/signup.dart';
import 'package:car_app/Login_Signup_Screens/starting_page.dart';
import 'package:car_app/views/bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NameCountryPage extends StatefulWidget {
  const NameCountryPage({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  State<NameCountryPage> createState() =>
      _NameCountryPageState(textPhone: phoneNumber);
}

class _NameCountryPageState extends State<NameCountryPage> {
  _NameCountryPageState({required this.textPhone});
  final _formKey = GlobalKey<FormState>();

  late String textName;
  late String textCountry;
  final String textPhone;

  late final TextEditingController _nameController;
  late final TextEditingController _countryController;

  String errorMessage = '';

  goHome() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Bottom_Nav(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _countryController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _countryController.dispose();

    super.dispose();
  }

  // Function for add user details to the Firebase

  Future addUserDetails2(String Phone) async {
    await FirebaseFirestore.instance
        .collection('users_2')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(
      {
        //'uid': FirebaseAuth.instance.currentUser?.uid,
        'name': textName,
        'country': dropdowncountry,
        'phone': Phone,
      },
    ).whenComplete(() => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StartingPage())));
  }

  String dropdowncountry = 'United States';

  // List of items in our dropdown menu
  var countries = [
    'Australia',
    'United States',
    'Sweden',
    'Canada',
    'United Kingdom',
  ];

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
                                height: 220,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 25, right: 25),
                                child: Column(
                                  children: [
                                    /*Form(
                                        key: _formKey,
                                        child: Expanded(
                                          flex: 8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 155, 155, 155),
                                              width: 1,
                                            )),
                                            padding: EdgeInsets.only(left: 15),
                                            child: TextFormField(
                                              
                                              maxLength: 10,
                                              controller: _controller,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  height: 2.0,
                                                  color: Colors.black),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 9.0,
                                                        horizontal: 2.0),
                                                fillColor: Colors.white,
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25.0,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                              /*validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter mobile number';
                                                }
                                                bool numValid = RegExp(
                                                        r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                                    .hasMatch(value);
                                                if (value.length == 0) {
                                                  return 'Please enter mobile number';
                                                } else if (!numValid) {
                                                  return 'Please enter a valid phone number';
                                                }
                                                return null;
                                              },*/
                                            ),
                                          ),
                                        ),
                                      ),*/

                                    // Name -------------------------------------------

                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          textName = value;
                                        },
                                        decoration: InputDecoration(
                                          //border: OutlineInputBorder(),
                                          labelText: 'Your Name',
                                          //hintText: 'Your Name',
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          prefix: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Text(''),
                                          ),
                                        ),
                                        keyboardType: TextInputType.name,
                                        controller: _nameController,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    // Country Dropdown ------------------------------------
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.only(left: 20, right: 5),
                                      width: double.infinity,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Color.fromARGB(255, 75, 75, 75),
                                            width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: DropdownButtonHideUnderline(
                                            child: Container()),
                                        //elevation: 16,

                                        borderRadius: BorderRadius.circular(5),
                                        // Initial Value
                                        value: dropdowncountry,

                                        // Down Arrow Icon
                                        icon: const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          size: 40,
                                        ),

                                        // Array list of items
                                        items: countries.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdowncountry = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      errorMessage,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 219, 36, 23)),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),

                                    //SignIn Button --------------------------------------------

                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      width: double.infinity,
                                      height: 43,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0, backgroundColor: Color.fromARGB(255, 0, 36, 105),
                                        ),
                                        onPressed: () {
                                          // if (_formKey.currentState!.validate()) {
                                          //   // If the form is valid, display a snackbar. In the real world,
                                          //   // you'd often call a server or save the information in a database.
                                          //   ScaffoldMessenger.of(context).showSnackBar(
                                          //     const SnackBar(
                                          //         content: Text('Processing Data')),
                                          //   );
                                          // }

                                          addUserDetails2(textPhone);

                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             StartingPage()));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Next",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
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
}
