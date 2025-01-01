// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:car_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Custom_rounder_button extends StatelessWidget {
  const Custom_rounder_button({
    Key? key,
    required this.sign_,
    required this.color_,
    required this.sign_color_,
  }) : super(key: key);

  final String sign_;
  final Color color_;
  final Color sign_color_;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        elevation: 10,
        child: SizedBox(
          width: 30,
          height: 30,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color_,
                border: Border.all(color: splashBackground)),
            child: Text(
              sign_,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: sign_color_,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
