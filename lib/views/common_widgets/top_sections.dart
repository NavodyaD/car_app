// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/utilfunction.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  TopSection({
    Key? key,
    this.isbackbutton,
    this.ontapx,
  }) : super(key: key);
  final Function? ontapx;
  bool? isbackbutton = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: Utils.Getwidth(context),
      child: Stack(
        children: [
          CustomSvg(svgname: 'shape1.svg'),
          CustomSvg(svgname: 'shape2.svg'),
          Positioned(
            top: 35,
            left: 33,
            child: isbackbutton == true
                ? BackButton(isbackbutton == true ? ontapx : () {})
                : Container(),
          ),
          Positioned(
            right: 0,
            child: CustomSvg(svgname: 'shape3.svg'),
          ),
        ],
      ),
    );
  }

  GestureDetector BackButton(ontap_) {
    return GestureDetector(
      onTap: ontap_,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          elevation: 6,
          child: SizedBox(
            height: 38,
            width: 38,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomSvg(
                svgname: 'back.svg',
                height: 22,
                width: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class BackButton extends StatelessWidget {
//   const BackButton({
//     Key? key,
//     required this.ontap_,
//   }) : super(key: key);
//   final Function? ontap_;
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 35,
//       left: 33,
//       child: GestureDetector(
//         onTap: () {},
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Material(
//             elevation: 6,
//             child: SizedBox(
//               height: 38,
//               width: 38,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: CustomSvg(
//                   svgname: 'back.svg',
//                   height: 22,
//                   width: 22,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
