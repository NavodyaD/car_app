import 'package:flutter/material.dart';

class Car_Brand_Widget extends StatelessWidget {
  Car_Brand_Widget(
      {Key? key,
      required this.brand_name,
      required this.logo_path,
      required this.short_description,
      this.onTapFunction});

  final String brand_name;
  final String short_description;
  final String logo_path;
  Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 88, 88, 88).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
              height: 100,
              alignment: Alignment.center,
              child: Image.network(
                logo_path,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              color: Color.fromARGB(136, 146, 146, 146),
              alignment: Alignment.center,
              height: 1,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            brand_name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Text(
              short_description,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
            ),
          ),
        ]),
      ),
    );
  }
}
