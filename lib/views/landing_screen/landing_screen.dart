import 'package:car_app/views/common_widgets/custom_button.dart';
import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: SizedBox(
        width: Utils.Getwidth(context),
        child: Stack(
          children: [
            Positioned(
              //top: Utils.Getheight(context) / 2,
              bottom: 0,
              child: SizedBox(
                width: Utils.Getwidth(context),
                //  padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Utils.Getimage('landing.png'),
              ),
            ),
            Positioned(
              top: Utils.Getheight(context) / 2 - 230,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Utils.Getimage('getting_started.png'),
              ),
            ),
            Positioned(
              top: Utils.Getheight(context) / 3 * 1.55,
              child: SizedBox(
                width: Utils.Getwidth(context),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 86,
                    ),
                    CustomText(
                      text: 'Congrats !',
                      fontsize: 44,
                      color: kwhite,
                      fontweight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    CustomText(
                      text: 'Your Account Has been created successfully. ',
                      fontsize: 15,
                      fontweight: FontWeight.w500,
                      color: kwhite,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
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
                      color_: kwhite,
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
