// ignore_for_file: must_be_immutable

import 'package:car_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  CustomSvg({
    Key? key,
    required this.svgname,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);
  Color? color;
  String svgname;
  double? width, height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Contants.svg_Path + svgname,
      width: width,
      height: height,
      color: color,
      fit: BoxFit.fill,
    );
  }
}
