// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomeTextField extends StatefulWidget {
  CustomeTextField({
    super.key,
    this.controler,
    this.hintfontsize,
    this.hintfontweight,
    this.hinttextcolor,
    this.enabled_textfield_boderside_color,
    this.facused_textfield_boderside_color,
    this.keyboardType,
    this.textfield_boderside_color,
    this.textfield_boderradious,
    this.isObscure,
    this.width,
    this.height,
    this.maxlenth,
    this.txtcolor,
    this.hovercolor,
    this.errortext,
    this.textfield_lable,
    this.hint_Text,
    this.prefixxicon,
    this.preffixwidget,
    this.suffixwidget,
    this.preffixiconwidget,
    this.focusedBorderRadious,
    this.isfacusednode,
    this.isfacuse,
    this.onchanged,
    this.maxline,
    this.textAlign,
  });

  final TextEditingController? controler;
  final double? width;
  final double? height;
  final double? textfield_boderradious;
  final double? focusedBorderRadious;
  final int? maxlenth;
  final keyboardType;
  final bool? isObscure;
  final Color? txtcolor;
  final Color? hovercolor;
  final String? errortext;
  final String? textfield_lable;
  final String? hint_Text;
  final Icon? prefixxicon;
  Color? textfield_boderside_color;
  Color? enabled_textfield_boderside_color;
  Color? facused_textfield_boderside_color;
  Widget? preffixwidget;
  Widget? preffixiconwidget;
  Widget? suffixwidget;
  FocusNode? isfacusednode;
  bool? isfacuse;
  Function()? onchanged;
  final Color? hinttextcolor;
  final FontWeight? hintfontweight;
  final double? hintfontsize;
  final int? maxline;
  final TextAlign? textAlign;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        focusNode: widget.isfacusednode,
        autofocus: widget.isfacuse ?? false,
        maxLength: widget.maxlenth,
        maxLines: widget.maxline ?? 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        obscureText: widget.isObscure ?? false,
        obscuringCharacter: "*",
        controller: widget.controler,
        textAlign: widget.textAlign ?? TextAlign.start,
        style: TextStyle(color: widget.txtcolor, fontWeight: FontWeight.w900),
        decoration: InputDecoration(
          suffixIcon: widget.suffixwidget,
          suffixIconColor: kblack,
          prefixIcon: widget.preffixiconwidget,
          prefix: widget.preffixwidget,
          errorText: widget.errortext,
          labelText: widget.textfield_lable,
          filled: true,
          hoverColor: widget.hovercolor,
          enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.textfield_boderradious ?? 0),
              borderSide: BorderSide(
                color: widget.enabled_textfield_boderside_color ?? kblack,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.focusedBorderRadious ?? 0),
              borderSide: BorderSide(
                color: widget.facused_textfield_boderside_color ?? kblack,
                width: 1.0,
              )),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hint_Text,
          hintStyle: TextStyle(
            fontSize: widget.hintfontsize ?? 14,
            fontWeight: widget.hintfontweight ?? FontWeight.w500,
            color: widget.hinttextcolor ?? kblack,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusColor: korange,
        ),
        onChanged: (value) => widget.onchanged,
      ),
    );
  }
}
