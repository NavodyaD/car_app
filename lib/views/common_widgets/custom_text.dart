// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.text,
      this.textAlign = TextAlign.center,
      this.color,
      this.fontsize,
      this.Isunderline,
      this.fontweight})
      : super(key: key);

  String text;
  FontWeight? fontweight;
  Color? color;
  double? fontsize;
  TextAlign textAlign;
  var Isunderline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: color,
          letterSpacing: .5,
          fontWeight: fontweight,
          fontSize: fontsize,
          decoration: Isunderline ?? TextDecoration.none,
        ),
      ),
    );
  }
}
