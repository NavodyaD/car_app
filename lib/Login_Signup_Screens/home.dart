// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage1 extends StatefulWidget {
//   const HomePage1({Key? key}) : super(key: key);

//   @override
//   State<HomePage1> createState() => _HomePage1State();
// }

// class _HomePage1State extends State<HomePage1> {
//   //final user = FirebaseAuth.instance.currentUser!;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: Text(
//                 "Welcome! Signed in as ",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//               },
//               color: Colors.deepPurple[200],
//               child: Text("Sign out"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
