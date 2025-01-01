// ignore_for_file: non_constant_identifier_names

import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:flutter/material.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    Key? key,
    required this.SociaMedia,
    required this.SocialMediaName,
  }) : super(key: key);
  final String SociaMedia;
  final String SocialMediaName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
          elevation: 12,
          child: Container(
            width: 139.26,
            height: 54,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomSvg(svgname: SociaMedia),
                ),
                CustomText(
                  text: SocialMediaName,
                  fontweight: FontWeight.w600,
                ),
                const SizedBox(
                  width: 15.74,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
