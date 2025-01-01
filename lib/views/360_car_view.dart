import 'package:flutter/material.dart';

class carView_screen extends StatefulWidget {
  const carView_screen({Key? key}) : super(key: key);

  @override
  State<carView_screen> createState() => _carView_screenState();
}

class _carView_screenState extends State<carView_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "360 View",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            "3D image here",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
