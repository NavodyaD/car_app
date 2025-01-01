// ignore_for_file: non_constant_identifier_names

import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/colors.dart';
import 'package:flutter/material.dart';

AppBar Customappbar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            color: kwhite,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: CustomSvg(
                  svgname: 'back.svg',
                  // width: 30,
                  // height: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: 'My Order',
          color: kblack,
          fontsize: 28,
          fontweight: FontWeight.w500,
        ),
      ],
    ),
    actions: [
      SizedBox(
        width: 50,
        height: 50,
        child: (GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              width: 38,
              height: 38,
              child: CustomSvg(svgname: 'menu.svg'),
            ),
          ),
        )),
      ),
    ],
  );
}
