// ignore_for_file: camel_case_types

import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';

class Top_section extends StatelessWidget {
  const Top_section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            // bottom: 0,
            child: SizedBox(
              width: Utils.Getwidth(context),
              //  padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Utils.Getimage('sign_in_eclips.png'),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: CustomText(
              text: 'Sign In',
              fontsize: 34,
              color: kwhite,
              fontweight: FontWeight.w700,
            ),
          ),
          Positioned(
            top: 142, right: -20,
            //Utils.Getheight(context) / 2 - 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Utils.Getimage('sign_in_car.png'),
            ),
          ),
        ],
      ),
    );
  }
}
