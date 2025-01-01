import 'package:car_app/views/common_widgets/custom_button.dart';
import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_textField.dart';
import '../common_widgets/top_section.dart';
import '../../utils/colors.dart';

final _email = TextEditingController();

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 400,
            child: Expanded(
              child: Top_section(),
            ),
          ),
          // const SizedBox(
          //   height: 29,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Enter your email',
                  fontweight: FontWeight.w400,
                  fontsize: 20,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomeTextField(
                  hint_Text: 'Someone@gmai.com',
                  hintfontsize: 16,
                  textfield_boderside_color: kblack,
                  controler: _email,
                  enabled_textfield_boderside_color: kgrayCollor,
                  facused_textfield_boderside_color: splashBackground,
                  keyboardType: TextInputType.emailAddress,
                  textfield_boderradious: 0,
                  focusedBorderRadious: 0,
                  suffixwidget: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: CustomSvg(svgname: 'correct.svg'),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomText(
                  text: 'We will send the OTP code to this mail',
                  fontweight: FontWeight.w500,
                  fontsize: 16,
                ),
                const SizedBox(
                  height: 200,
                ),
                SizedBox(
                  child: SizedBox(
                    width: Utils.Getwidth(context) - 62,
                    height: 57,
                    child: Custom_button(
                      buttontex: "Sign In",
                      txtcolor_: kwhite,
                      onpress: () {},
                      radius: 15,
                      elavition_: 0,
                      fontsize_: 20,
                      color_: kblue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
