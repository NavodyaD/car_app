// ignore_for_file: must_be_immutable, camel_case_types

import 'package:car_app/views/common_widgets/custom_button.dart';
import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common_widgets/top_section.dart';
import '../../utils/colors.dart';

final _code1 = TextEditingController();
final _code2 = TextEditingController();
final _code3 = TextEditingController();
final _code4 = TextEditingController();
final _code5 = TextEditingController();
final _code6 = TextEditingController();

class SignVerificationScreen extends StatelessWidget {
  const SignVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    text: 'Enter verification code',
                    fontweight: FontWeight.w500,
                    fontsize: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomText(
                    text: 'We have sent a code to your mail so*****@gmail.com',
                    fontweight: FontWeight.w400,
                    fontsize: 16,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Custome_OTP_textfied(
                        iSlastNod_: false,
                        iSautofocus_: true,
                        controler_: _code1,
                      ),
                      Custome_OTP_textfied(
                        iSlastNod_: false,
                        controler_: _code2,
                      ),
                      Custome_OTP_textfied(
                        iSlastNod_: false,
                        controler_: _code3,
                      ),
                      Custome_OTP_textfied(
                        iSlastNod_: false,
                        controler_: _code4,
                      ),
                      Custome_OTP_textfied(
                        iSlastNod_: false,
                        controler_: _code5,
                      ),
                      Custome_OTP_textfied(
                        iSlastNod_: true,
                        controler_: _code6,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: 'Verification code is invalid. Please try again',
                    fontweight: FontWeight.w500,
                    fontsize: 13,
                    color: kred,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Resend Code',
                        fontweight: FontWeight.w500,
                        fontsize: 13,
                        color: kblue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    child: SizedBox(
                      width: Utils.Getwidth(context) - 62,
                      height: 57,
                      child: Custom_button(
                        buttontex: "Verify",
                        txtcolor_: kwhite,
                        onpress: () {},
                        radius: 0,
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
      ),
    );
  }
}

class Custome_OTP_textfied extends StatelessWidget {
  Custome_OTP_textfied({
    Key? key,
    required this.controler_,
    this.iSautofocus_,
    required this.iSlastNod_,
    //this.onchanged_,
  }) : super(key: key);

  final TextEditingController controler_;
  bool? iSautofocus_;
  bool iSlastNod_;
  //Function()? onchanged_;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 59,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: const Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(.0, 6.0),
            blurRadius: 10.0,
          ),
        ],
        color: const Color(0xFFEFEEEE),
        // borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: 50,
        height: 68,
        child: TextField(
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          decoration: const InputDecoration(
            //hintText: '0',
            // hintStyle: TextStyle(color: kgrayCollor),
            fillColor: Colors.white,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: splashBackground),
            ),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: kgrayCollor),
            ),
            filled: true,
          ),

          autofocus: iSautofocus_ ?? false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {
            if (value.length == 1) {
              !iSlastNod_
                  ? FocusScope.of(context).nextFocus()
                  : FocusScope.of(context).onKeyEvent;
            }
          },
          controller: controler_,
          textAlign: TextAlign.center,
          showCursor: true,
          keyboardType: TextInputType.number,
          // focusNode: facusedNode_,
        ),
      ),
    );
  }
}

// CustomText(
//             text: 'Vefification Code',
//             color: kblack,
//             fontsize: 36.41,
//             fontweight: FontWeight.w600,
//             textAlign: TextAlign.center,
//           ),

// Scaffold(
//       body: Column(
//         children: [
//           TopSection(
//             isbackbutton: true,
//             ontapx: () {},
//           ),
//           const SizedBox(
//             height: 80,
//           ),
//           CustomText(
//             text: 'Vefification Code',
//             color: kblack,
//             fontsize: 36.41,
//             fontweight: FontWeight.w600,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 12),
//           CustomText(
//             text: 'Please type the verification code sent to\n provided email',
//             color: kblack,
//             fontsize: 16,
//             fontweight: FontWeight.w400,
//             textAlign: TextAlign.start,
//           ),
//           const SizedBox(
//             height: 31,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [],
//           ),
//         ],
//       ),
//     );
