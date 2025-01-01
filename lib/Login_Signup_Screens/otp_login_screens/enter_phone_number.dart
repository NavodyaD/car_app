import 'package:car_app/Login_Signup_Screens/button1.dart';
import 'package:car_app/Login_Signup_Screens/google_auth_service.dart';
import 'package:car_app/Login_Signup_Screens/home.dart';
import 'package:car_app/Login_Signup_Screens/otp_login_screens/otp_screen.dart';
import 'package:car_app/Login_Signup_Screens/signup.dart';
import 'package:car_app/views/bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Enter_Phone_Number extends StatefulWidget {
  const Enter_Phone_Number({Key? key}) : super(key: key);

  @override
  State<Enter_Phone_Number> createState() => _Enter_Phone_NumberState();
}

class _Enter_Phone_NumberState extends State<Enter_Phone_Number> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _phone_controller;

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
    _phone_controller = TextEditingController();
  }

  @override
  void dispose() {
    _phone_controller.dispose();
    super.dispose();
  }

  // Initial Selected Value
  String dropdownvalue = '+94';

  // List of items in our dropdown menu
  var items = [
    '+94',
    '+75',
    '+72',
    '+13',
    '+34',
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
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(left: 10),
                                            width: 100,
                                            height: 66,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 155, 155, 155),
                                                  style: BorderStyle.solid,
                                                  width: 1.0),
                                            ),
                                            child: DropdownButton(
                                              underline:
                                                  DropdownButtonHideUnderline(
                                                      child: Container()),
                                              //elevation: 16,

                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // Initial Value
                                              value: dropdownvalue,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                Icons.arrow_drop_down_rounded,
                                                size: 40,
                                              ),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Phone Number',
                                                prefix: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Text(''),
                                                ),
                                              ),
                                              maxLength: 12,
                                              keyboardType: TextInputType.phone,
                                              controller: _phone_controller,
                                            ),
                                          ),
                                        )
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
                                      ],
                                    ),
                                    Text(
                                      errorMessage,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 219, 36, 23)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
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
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OTP_Screen(
                                                          dropdownvalue,
                                                          _phone_controller
                                                              .text)));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Send OTP",
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
}

// class SignUp1 extends StatefulWidget {
//   const SignUp1({Key? key}) : super(key: key);

//   @override
//   State<SignUp1> createState() => _SignUp1State();
// }

// class _SignUp1State extends State<SignUp1> {
//   final _formKey = GlobalKey<FormState>();

//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _countryController = TextEditingController();

//   String dropdownvalue = '+94';

//   // List of items in our dropdown menu
//   var items = [
//     '+94',
//     '+75',
//     '+72',
//     '+13',
//     '+34',
//   ];

//   String dropdowncountry = 'United States';

//   // List of items in our dropdown menu
//   var countries = [
//     'Australia',
//     'United States',
//     'Sweden',
//     'Canada',
//     'United Kingdom',
//   ];

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     _phoneController.dispose();
//     _countryController.dispose();

//     super.dispose();
//   }

//   Future signUp() async {
//     //create user
//     await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//       email: _emailController.text.trim(),
//       password: _passwordController.text.trim(),
//     )
//         .whenComplete((() {
//       FirebaseAuth.instance.authStateChanges().listen((User? user) {
//         if (user != null) {
//           String? user_id = FirebaseAuth.instance.currentUser?.uid;
//           print(user.uid);
//         }
//       });
//       addUserDetails(
//         _nameController.text.trim(),
//         int.parse(
//           dropdownvalue.trim() + _phoneController.text.trim(),
//         ),
//         _emailController.text.trim(),
//         dropdowncountry.trim(),
//       );
//     }));

//     // add user details
//   }

//   Future addUserDetails(
//       String name, int phone, String email, String country) async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .set(
//       {
//         'userid': FirebaseAuth.instance.currentUser?.uid,
//         'name': name,
//         'phone': phone,
//         'email': email,
//         'country': country,
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(builder: (context, constraints) {
//         late final maxHeight;
//         if (MediaQuery.of(context).orientation == Orientation.portrait) {
//           maxHeight = constraints.maxHeight;
//         } else {
//           maxHeight = constraints.maxHeight * 1.5;
//         }
//         return SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             //physics: BouncingScrollPhysics(),
//             child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                     minHeight: MediaQuery.of(context).size.height),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Stack(
//                       children: [
//                         Hero(
//                           tag: 'ellipse2',
//                           child: Image.asset(
//                             "assets/ellipse2.png",
//                             height: 180,
//                             width: double.infinity,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(
//                             left: 180,
//                           ),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 55,
//                               ),
//                               Hero(
//                                 tag: 'car2',
//                                 child: Image.asset(
//                                   "assets/car2.png",
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                                 alignment: Alignment.centerLeft,
//                                 padding: EdgeInsets.only(left: 30, top: 50),
//                                 child: Text(
//                                   "Sign Up",
//                                   style: TextStyle(
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white),
//                                 )),
//                             SizedBox(
//                               height: 120,
//                             ),
//                             Form(
//                               key: _formKey,
//                               child: Container(
//                                 padding: EdgeInsets.only(left: 25, right: 25),
//                                 child: Column(
//                                   children: [
//                                     // Name Text Field
//                                     Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           "Name",
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w400),
//                                         )),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     TextFormField(
//                                       controller: _nameController,
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.fromLTRB(
//                                             10.0, 8.0, 20.0, 8.0),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: 1,
//                                               color: Color.fromARGB(
//                                                   255, 75, 75, 75)),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 34, 34, 34)),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 221, 26, 12),
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         //hintText: 'Email',
//                                         //labelText: "Name",
//                                         //errorText: "Please enter your name",
//                                       ),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return "Please enter name";
//                                         }

//                                         return null;
//                                       },
//                                     ),

//                                     SizedBox(
//                                       height: 15,
//                                     ),

//                                     // Phone number Text Form Field
//                                     Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           "Phone Number",
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w400),
//                                         )),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       children: [
//                                         // Drop down button
//                                         Flexible(
//                                           flex: 3,
//                                           child: DropdownButton(
//                                             underline:
//                                                 DropdownButtonHideUnderline(
//                                                     child: Container()),
//                                             //elevation: 16,

//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             // Initial Value
//                                             value: dropdownvalue,

//                                             // Down Arrow Icon
//                                             icon: const Icon(
//                                               Icons.arrow_drop_down_rounded,
//                                               size: 40,
//                                             ),

//                                             // Array list of items
//                                             items: items.map((String items) {
//                                               return DropdownMenuItem(
//                                                 value: items,
//                                                 child: Text(items),
//                                               );
//                                             }).toList(),
//                                             // After selecting the desired option,it will
//                                             // change button value to selected value
//                                             onChanged: (String? newValue) {
//                                               setState(() {
//                                                 dropdownvalue = newValue!;
//                                               });
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 15,
//                                         ),
//                                         Flexible(
//                                           flex: 9,
//                                           child: TextFormField(
//                                             keyboardType: TextInputType.number,
//                                             controller: _phoneController,
//                                             decoration: InputDecoration(
//                                               contentPadding:
//                                                   EdgeInsets.fromLTRB(
//                                                       10.0, 8.0, 20.0, 8.0),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     width: 1,
//                                                     color: Color.fromARGB(
//                                                         255, 75, 75, 75)),
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                               focusedBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Color.fromARGB(
//                                                         255, 34, 34, 34)),
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                               errorBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide(
//                                                     color: Color.fromARGB(
//                                                         255, 221, 26, 12),
//                                                   ),
//                                                   borderRadius:
//                                                       BorderRadius.circular(8)),
//                                             ),
//                                             validator: (value) {
//                                               if (value == null ||
//                                                   value.isEmpty) {
//                                                 return "Please enter phone number";
//                                               }

//                                               return null;
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     //Country Text form field
//                                     Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           "Country",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w400),
//                                         )),
//                                     SizedBox(
//                                       height: 5,
//                                     ),

//                                     Container(
//                                       padding:
//                                           EdgeInsets.only(left: 20, right: 5),
//                                       width: double.infinity,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color:
//                                                 Color.fromARGB(255, 75, 75, 75),
//                                             width: 1),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(8)),
//                                       ),
//                                       child: DropdownButton(
//                                         isExpanded: true,
//                                         underline: DropdownButtonHideUnderline(
//                                             child: Container()),
//                                         //elevation: 16,

//                                         borderRadius: BorderRadius.circular(5),
//                                         // Initial Value
//                                         value: dropdowncountry,

//                                         // Down Arrow Icon
//                                         icon: const Icon(
//                                           Icons.arrow_drop_down_rounded,
//                                           size: 40,
//                                         ),

//                                         // Array list of items
//                                         items: countries.map((String items) {
//                                           return DropdownMenuItem(
//                                             value: items,
//                                             child: Text(items),
//                                           );
//                                         }).toList(),
//                                         // After selecting the desired option,it will
//                                         // change button value to selected value
//                                         onChanged: (String? newValue) {
//                                           setState(() {
//                                             dropdowncountry = newValue!;
//                                           });
//                                         },
//                                       ),
//                                     ),
// // Email Text form field
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           "Email",
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w400),
//                                         )),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     TextFormField(
//                                       controller: _emailController,
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.fromLTRB(
//                                             10.0, 8.0, 20.0, 8.0),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: 1,
//                                               color: Color.fromARGB(
//                                                   255, 75, 75, 75)),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 34, 34, 34)),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 221, 26, 12),
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         //hintText: 'Email',
//                                         //labelText: "Name",
//                                         //errorText: "Please enter your name",
//                                       ),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return "Please enter your email";
//                                         }

//                                         return null;
//                                       },
//                                     ),

//                                     SizedBox(
//                                       height: 15,
//                                     ),
// // Password Text Form Field
//                                     Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           "Password",
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w400),
//                                         )),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     TextFormField(
//                                       obscureText: true,
//                                       controller: _passwordController,
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.fromLTRB(
//                                             10.0, 8.0, 20.0, 8.0),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               width: 1,
//                                               color: Color.fromARGB(
//                                                   255, 75, 75, 75)),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 34, 34, 34)),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Color.fromARGB(
//                                                   255, 221, 26, 12),
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                         //hintText: 'Email',
//                                         //labelText: "Name",
//                                         //errorText: "Please enter your name",
//                                       ),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return "Enter password";
//                                         }

//                                         return null;
//                                       },
//                                     ),

//                                     SizedBox(
//                                       height: 25,
//                                     ),

//                                     GestureDetector(
//                                         onTap: () {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             // If the form is valid, display a snackbar. In the real world,
//                                             // you'd often call a server or save the information in a database.
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               const SnackBar(
//                                                   content:
//                                                       Text('Processing Data')),
//                                             );

//                                             //signUp();

//                                             // Navigate Sign Up Page

//                                           }
//                                         },
//                                         child: Button2(buttonText: "Sign Up")),

//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text("Already Have Account? "),
//                                         GestureDetector(
//                                           onTap: () =>
//                                               Navigator.of(context).push(
//                                             MaterialPageRoute(
//                                               builder: (context) => Login1(),
//                                             ),
//                                           ),
//                                           child: Text(
//                                             "Login",
//                                             style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 0, 36, 105),
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 )));
//       }),
//     );
//   }
// }
