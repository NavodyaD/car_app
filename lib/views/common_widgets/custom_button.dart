// ignore_for_file: camel_case_types, must_be_immutable

import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';

class Custom_button extends StatefulWidget {
  Custom_button({
    super.key,
    required this.buttontex,
    required this.onpress,
    required this.radius,
    this.color_,
    this.elavition_,
    this.fontsize_,
    this.txtcolor_,
  });

  String buttontex;
  Function() onpress;
  final double radius;
  final Color? color_;
  final Color? txtcolor_;
  final double? elavition_;
  final double? fontsize_;

  @override
  State<Custom_button> createState() => _Custom_buttonState();
}

class _Custom_buttonState extends State<Custom_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: Utils.KdefaultBoxShadow(),
        color: const Color(0xFFEFEEEE),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            //backgroundColor: widget.color_ ?? kyellow,
            elevation: widget.elavition_ ?? 5,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: widget.onpress,
          child: CustomText(
            textAlign: TextAlign.center,
            text: widget.buttontex,
            fontweight: FontWeight.w600,
            color: widget.txtcolor_ ?? kblack,
            fontsize: widget.fontsize_ ?? 11,
          ),
        ),
      ),
    );
  }
}
