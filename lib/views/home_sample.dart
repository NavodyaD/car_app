import 'package:car_app/views/pick_your_car_screen/pick_your_car_screen.dart';
import 'package:car_app/views/read_about_screen/read_about_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeSample extends StatefulWidget {
  const HomeSample({Key? key}) : super(key: key);

  @override
  State<HomeSample> createState() => _HomeSampleState();
}

class _HomeSampleState extends State<HomeSample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PickYourCarModel(),
                    ),
                  );
                }),
                child: Container(
                  color: Colors.blue,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                  child: Text("Pick your car"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReadAboutCars(),
                    ),
                  );
                },
                child: Container(
                  color: Colors.blue,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                  child: Text("Read about cars"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.deepPurple[200],
                child: Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
