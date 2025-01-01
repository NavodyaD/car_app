import 'package:flutter/material.dart';

class yourCar_Screen extends StatefulWidget {
  const yourCar_Screen({Key? key}) : super(key: key);

  @override
  State<yourCar_Screen> createState() => _yourCar_ScreenState();
}

class _yourCar_ScreenState extends State<yourCar_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.black,
        // ),
        title: Text(
          "   Your Car",
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
      body: Column(
        children: [
          // search field
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(14),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     offset: Offset(0, 12),
                //     blurRadius: 16,
                //   )
                // ]
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    hintText: "Search Your Car",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
