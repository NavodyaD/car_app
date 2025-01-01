// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../../utils/utilfunction.dart';
import 'custom_text.dart';

class Main_slider extends StatefulWidget {
  const Main_slider({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.imgname,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final String imgname;

  @override
  State<Main_slider> createState() => _Main_sliderState();
}

class _Main_sliderState extends State<Main_slider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 24,
        bottom: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      // textAlign: TextAlign.start,
                      text: widget.text1,
                      fontsize: 24.2,
                      fontweight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: widget.text2,
                      fontsize: 19.2,
                      fontweight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      textAlign: TextAlign.start,
                      text: widget.text3,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      //width: Utils.Getwidth(context) / 4 * 1.8,
                      child: Utils.Getimage(widget.imgname),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




  // SizedBox(
  //             height: 175,
  //             width: Utils.Getwidth(context),
  //             child: PageView(
  //               controller: pageControler,
  //               children: [
  //                 ListView.builder(
  //                   scrollDirection: Axis.horizontal,
  //                   physics: const BouncingScrollPhysics(),
  //                   itemCount: Car_details.length,
  //                   itemBuilder: (context, index) {
  //                     return Row(
  //                       children: [
  //                         Card(
  //                           child: SizedBox(
  //                             width: Utils.Getwidth(context) - 20,
  //                             child: Main_slider(
  //                               text1: Car_details[index].text1,
  //                               text2: Car_details[index].text2,
  //                               text3: Car_details[index].text3,
  //                               imgname: Car_details[index].imageName,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     );
  //                     // const SizedBox(
  //                     //   width: 15,
  //                     // );
  //                   },
  //                 ),
  //                 // SizedBox(
  //                 //   width: 130,
  //                 //   height: 19,
  //                 //   child: SmoothPageIndicator(
  //                 //     controller: pageControler, // PageController
  //                 //     count: 6,

  //                 //     // forcing the indicator to use a specific direction
  //                 //     textDirection: TextDirection.rtl,
  //                 //     effect: const WormEffect(),
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //           ),


   // SizedBox(
            //   height: 180,
            //   width: Utils.Getwidth(context),
            //   child: PageView(
            //     controller: pageControler,
            //     onPageChanged: (value) {
            //       setState(() {});
            //     },
            //     children: [
            //       ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         physics: const BouncingScrollPhysics(),
            //         itemCount: Car_details.length,
            //         itemBuilder: (context, index) {
            //           return Column(
            //             children: [
            //               SizedBox(
            //                 height: 185,
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(20),
            //                   child: Card(
            //                     color: klightblue,
            //                     child: Main_slider(
            //                       text1: Car_details[index].text1,
            //                       text2: Car_details[index].text2,
            //                       text3: Car_details[index].text3,
            //                       imgname: Car_details[index].imageName,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           );
            //           // const SizedBox(
            //           //   width: 15,
            //           // );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: SizedBox(
            //     // width: 130,
            //     height: 10,
            //     child: SmoothPageIndicator(
            //       controller: pageControler, // PageController
            //       count: Car_details.length,

            //       // forcing the indicator to use a specific direction
            //       // textDirection: TextDirection.rtl,
            //       // effect: const WormEffect(),
            //     ),
            //   ),
            // ),
         