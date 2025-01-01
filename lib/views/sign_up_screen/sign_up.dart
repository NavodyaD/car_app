// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_element

import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_textField.dart';

final _userName = TextEditingController();
final _email = TextEditingController();
final _phone_no = TextEditingController();
final _password = TextEditingController();
final _Confirm_password = TextEditingController();
const countryPicker = FlCountryCodePicker();
bool ischeck = false;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              child: Top_section_sign_up_page(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  CustomText(
                    text: 'Name',
                    fontweight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomeTextField(
                    hint_Text: ' Your name',
                    hinttextcolor: kgrayCollor,
                    textfield_boderside_color: kblack,
                    controler: _userName,
                    enabled_textfield_boderside_color: kgrayCollor,
                    facused_textfield_boderside_color: splashBackground,
                    keyboardType: null,
                    textfield_boderradious: 8,
                    focusedBorderRadious: 8,
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  CustomText(
                    text: 'E-mail',
                    fontweight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomeTextField(
                    hint_Text: 'Your email',
                    hinttextcolor: kgrayCollor,
                    textfield_boderside_color: kblack,
                    controler: _email,
                    enabled_textfield_boderside_color: kgrayCollor,
                    facused_textfield_boderside_color: splashBackground,
                    keyboardType: null,
                    textfield_boderradious: 8,
                    focusedBorderRadious: 8,
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  CustomText(
                    text: 'Pnone Number',
                    fontweight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomeTextField(
                    hint_Text: 'Your phone number',
                    hinttextcolor: kgrayCollor,
                    textfield_boderside_color: kblack,
                    controler: _phone_no,
                    enabled_textfield_boderside_color: kgrayCollor,
                    facused_textfield_boderside_color: splashBackground,
                    keyboardType: TextInputType.phone,
                    textfield_boderradious: 8,
                    focusedBorderRadious: 8,
                    preffixiconwidget: SizedBox(
                      width: 85,
                      child: GestureDetector(
                        onTap: () async {
                          final code =
                              await countryPicker.showPicker(context: context);
                          if (code != null) {
                            Logger().d(code);
                            Logger().d(code.name);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Row(
                            children: [
                              const Text(
                                '+94',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomSvg(
                                svgname: 'down-arrow.svg',
                                width: 15,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // GestureDetector(
                  //   onTap: () async {
                  //     final code =
                  //         await countryPicker.showPicker(context: context);
                  //     if (code != null) print(code);
                  //   },
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomText(
                    text: 'Country',
                    fontweight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomeTextField(
                    hint_Text: 'Your Country',
                    hinttextcolor: kgrayCollor,
                    textfield_boderside_color: kblack,
                    controler: _email,
                    enabled_textfield_boderside_color: kgrayCollor,
                    facused_textfield_boderside_color: splashBackground,
                    keyboardType: null,
                    textfield_boderradious: 8,
                    focusedBorderRadious: 8,
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    children: [
                      //true for checked checkbox, false for unchecked one
                      Checkbox(
                          //only check box
                          value: ischeck, //unchecked
                          onChanged: (bool? value) {}),
                      CustomText(
                          text: 'I agree to terms and conditions ',
                          color: kblue,
                          fontsize: 16,
                          fontweight: FontWeight.w600),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: Utils.Getwidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            child: SizedBox(
                              width: Utils.Getwidth(context) - 72,
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: '  Already have an account?',
                        fontweight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Utils.NavigateTo(
                          //   context,
                          //   const LoginScreen(),
                          // );

                          Logger().wtf('Sign In');
                        },
                        child: CustomText(
                          text: '  Sign In',
                          color: kblue,
                          fontweight: FontWeight.w600,
                          fontsize: 20,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Skip Now',
                        fontweight: FontWeight.w700,
                        fontsize: 20,
                        color: kblue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool inputValidation(BuildContext context) {
    bool isValid = false;
    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _Confirm_password.text.isEmpty ||
        _phone_no.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all field  !.'),
        ),
      );
      isValid = false;
    } else if (_phone_no.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('please enter valied phone number.'),
        ),
      );
    } else if (!EmailValidator.validate(_email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('please enter valied Email Id.'),
        ),
      );
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}

// --------------  top section for sign up page -------------------------------//
class Top_section_sign_up_page extends StatelessWidget {
  const Top_section_sign_up_page({
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
              child: Utils.Getimage('sign_up_eclips.png'),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: CustomText(
              text: 'Sign Up',
              fontsize: 34,
              color: kwhite,
              fontweight: FontWeight.w700,
            ),
          ),
          Positioned(
            top: 53,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Utils.Getimage('sign_up.png'),
            ),
          ),
        ],
      ),
    );
  }
}
