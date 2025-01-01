import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: const Divider(
                color: kwhite,
                height: 50,
              )),
        ),
        CustomText(
          text: 'sign in with',
          fontsize: 20,
          fontweight: FontWeight.w600,
          color: kwhite,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: kwhite,
              height: 80,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
