import 'package:car_app/Login_Signup_Screens/button1.dart';
import 'package:car_app/Login_Signup_Screens/home.dart';
import 'package:car_app/views/bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'signup.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Enter your email",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 8.0, 20.0, 8.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 75, 75, 75)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 34, 34, 34)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 221, 26, 12),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        //hintText: 'Email',
                                        //labelText: "Name",
                                        //errorText: "Please enter your name",
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your email";
                                        }

                                        return null;
                                      },
                                    ),

                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Password Text Form Field
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Enter your password",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 8.0, 20.0, 8.0),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 75, 75, 75)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 34, 34, 34)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 221, 26, 12),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        //hintText: 'Email',
                                        //labelText: "Name",
                                        //errorText: "Please enter your name",
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter password";
                                        }

                                        return null;
                                      },
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

                                            try {
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: _emailController
                                                          .text
                                                          .trim(),
                                                      password:
                                                          _passwordController
                                                              .text
                                                              .trim())
                                                  .then((value) => goHome());

                                              errorMessage = '';
                                            } on FirebaseAuthException catch (error) {
                                              errorMessage = error.message!;
                                            }

                                            setState(() {});

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
                                        Text("Don't Have Account? "),
                                        GestureDetector(
                                          onTap: () =>
                                              Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => SignUp1(),
                                            ),
                                          ),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 0, 36, 105),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
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
