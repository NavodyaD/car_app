import 'package:car_app/views/car_detail_screen/car_details_screen.dart';
import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/utilfunction.dart';

class Populer_Car_Model extends StatelessWidget {
  Populer_Car_Model({
    Key? key,
    required this.imageName,
    required this.carModel,
    required this.carDiscription,
    required this.yom,
    this.islike,
    this.actinsOnTap,
  }) : super(key: key);
  final String imageName;
  final String carModel;
  final String yom;
  final String carDiscription;
  bool? islike;
  Function()? actinsOnTap;

//Only added 1 Car Details Screen

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actinsOnTap,
      child: Container(
        color: kblue,
        width: Utils.Getwidth(context) / 3 * 1.4,
        height: Utils.Getheight(context) / 3 * 1.3,
        child: Stack(
          children: [
            SizedBox(
              width: Utils.Getwidth(context) / 3 * 1.4,
              height: Utils.Getheight(context) / 3 * 1.3,
              child: Utils.Getimage(imageName),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: SizedBox(
                width: 25,
                height: 25,
                child: CustomSvg(svgname: islike! ? 'like.svg' : 'dislike.svg'),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                //height: 71,
                width: Utils.Getwidth(context) / 3 * 1.4,
                child: Container(
                  color: Colors.white38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              // textAlign: TextAlign.start,
                              text: carModel,
                              fontsize: 15,
                              color: kwhite,
                              fontweight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            CustomText(
                              text: yom,
                              fontsize: 12,
                              color: kwhite,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CustomText(
                          fontsize: 11,
                          textAlign: TextAlign.start,
                          color: kwhite,
                          text: carDiscription,
                        ),
                      ],
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
