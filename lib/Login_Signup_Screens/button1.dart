import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({required this.buttonText});
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(186, 0, 0, 0).withOpacity(0.1),
              spreadRadius: 20,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      alignment: Alignment.center,
      height: 40,
      width: double.infinity,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 7, 33, 82),
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({required this.buttonText});
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(186, 0, 0, 0).withOpacity(0.1),
              spreadRadius: 20,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Color.fromARGB(255, 0, 36, 105),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      alignment: Alignment.center,
      height: 40,
      width: double.infinity,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
