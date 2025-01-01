// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'custom_text.dart';
import 'custome_svg.dart';

class CustomAppbar2 extends StatelessWidget {
  CustomAppbar2({
    Key? key,
    this.title,
    //this.leadingSvg,
    this.actionsSvg,
    this.actinsOnTap,
    //this.leadingOnTap,
    this.IscenterTitle,
  }) : super(key: key);
  String? title;
  //String? leadingSvg;
  String? actionsSvg;
  bool? IscenterTitle;
  //Function()? leadingOnTap;
  Function()? actinsOnTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back_ios_new_rounded,
      //     color: Colors.black,
      //   ),
      //   onPressed: leadingOnTap,
      // ),
      title: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: title!,
              color: kblack,
              fontsize: 21,
              fontweight: FontWeight.w600,
            ),
          ],
        ),
      ),
      centerTitle: IscenterTitle ?? false,
      actions: [
        SizedBox(
          width: 50,
          height: 50,
          child: (GestureDetector(
            onTap: actinsOnTap,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 6,
                right: 6,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSvg(svgname: actionsSvg!),
              ),
            ),
          )),
        ),
      ],
    );
  }
}
