import 'package:car_app/views/common_widgets/custom_button.dart';
import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: SizedBox(
        width: Utils.Getwidth(context),
        child: Stack(
          children: [
            SizedBox(
              // width: Utils.Getwidth(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 86,
                    ),
                    CustomText(
                      text: 'LOGO',
                      fontsize: 64,
                      color: kwhite,
                      fontweight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    CustomText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor \n incididunt ut labore et magna aliqua. ',
                      fontsize: 20,
                      fontweight: FontWeight.w500,
                      color: kwhite,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Utils.Getheight(context) / 2,
              bottom: 0,
              child: SizedBox(
                width: Utils.Getwidth(context),
                //  padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Utils.Getimage('Ellipse.png'),
              ),
            ),
            Positioned(
              top: Utils.Getheight(context) / 2 - 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Utils.Getimage('getting_started.png'),
              ),
            ),
            Positioned(
              top: Utils.Getheight(context) / 2 + 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 31),
                child: SizedBox(
                  child: SizedBox(
                    width: Utils.Getwidth(context) - 62,
                    height: 57,
                    child: Custom_button(
                      buttontex: "Get Started",
                      onpress: () {},
                      radius: 15,
                      elavition_: 0,
                      fontsize_: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
