// ignore_for_file: non_constant_identifier_names, dead_code

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Utils {
  static String imagePath = 'lib/assets/images/';

  static void NavigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void Navigateback(BuildContext context, Widget widget) {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static Getimage(String img) {
    return Image.asset(
      imagePath + img,
      fit: BoxFit.cover,
    );
  }

  static Getwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
    Logger().d(MediaQuery.of(context).size);
  }

  static Getheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
    Logger().d(MediaQuery.of(context).size);
  }

  static List<BoxShadow> KdefaultBoxShadow() {
    return [
      BoxShadow(
        color: const Color.fromARGB(255, 205, 213, 235).withOpacity(1),
        offset: const Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: const Color.fromARGB(255, 106, 77, 238).withOpacity(0.4),
        offset: const Offset(.8, 6.0),
        blurRadius: 10.0,
      ),
    ];
  }

  static List<BoxShadow> kcontainerBoxshadow() {
    return [
      BoxShadow(
        color: const Color.fromARGB(255, 206, 200, 200).withOpacity(1),
        offset: const Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: const Color.fromARGB(255, 161, 161, 161).withOpacity(0.4),
        offset: const Offset(.8, 6.0),
        blurRadius: 10.0,
      ),
    ];
  }
}
