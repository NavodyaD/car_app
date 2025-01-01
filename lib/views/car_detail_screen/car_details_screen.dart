import 'package:car_app/utils/utilfunction.dart';
import 'package:car_app/views/360_car_view.dart';
import 'package:car_app/views/read_about_screen/read_about_screen.dart';
import 'package:flutter/material.dart';

import '../../model/data.dart';
import '../../utils/colors.dart';
import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_text.dart';
import '../common_widgets/custome_svg.dart';

class CarDetailsScreen extends StatelessWidget {
  final String car_name;
  final String year;
  final String description;
  final String fuel;
  final String seats;
  final String transmission;
  final String doors;
  final String range;
  final String speed;
  final String power;
  final String cover_image;

  const CarDetailsScreen({
    //super.key,
    required this.car_name,
    required this.year,
    required this.description,
    required this.fuel,
    required this.seats,
    required this.transmission,
    required this.doors,
    required this.range,
    required this.speed,
    required this.power,
    required this.cover_image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: Utils.Getwidth(context),
          height: 1400,
          child: Stack(
            children: [
              SizedBox(
                width: Utils.Getwidth(context),
                height: 280,
                child: Utils.Getimage(cover_image),
              ),
              Positioned(
                top: 44,
                child: SizedBox(
                  width: Utils.Getwidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: (GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SizedBox(
                                  width: 38,
                                  height: 38,
                                  child: Icon(Icons.arrow_back_ios_new_rounded),
                                ),
                              ),
                            )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomText(
                            text: 'Car Details',
                            color: kblack,
                            fontsize: 21,
                            fontweight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: (GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SizedBox(
                                  width: 38,
                                  height: 38,
                                  child: CustomSvg(svgname: 'menu.svg'),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 220,
                child: SizedBox(
                  width: Utils.Getwidth(context),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Container(
                      color: kwhite,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      fontsize: 20,
                                      fontweight: FontWeight.w600,
                                      text: car_name,
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    CustomText(
                                      fontsize: 15,
                                      fontweight: FontWeight.w600,
                                      text: year + ' model',
                                      color: kblack.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      child: SizedBox(
                                        width: Utils.Getwidth(context) / 3,
                                        height: 45,
                                        child: Custom_button(
                                          buttontex: "360 View",
                                          txtcolor_: kwhite,
                                          onpress: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    carView_screen(),
                                              ),
                                            );
                                          },
                                          radius: 25,
                                          elavition_: 0,
                                          fontsize_: 16,
                                          color_:
                                              Color.fromARGB(255, 0, 36, 105)
                                                  .withOpacity(1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: Utils.Getwidth(context),
                              height: 150,
                              child: Flexible(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  fontsize: 14,
                                  fontweight: FontWeight.w500,
                                  text: description,
                                  color: kblack.withOpacity(0.5),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 31,
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Vehicel_info(
                                          svgname: 'fule.svg',
                                          text1: 'FUEL',
                                          text2: fuel,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Vehicel_info(
                                          svgname: 'seat.svg',
                                          text1: 'SEATS',
                                          text2: seats,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Vehicel_info(
                                          svgname: 'gear.svg',
                                          text1: 'TRANSMISSION',
                                          text2: transmission,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Vehicel_info(
                                          svgname: 'door.svg',
                                          text1: 'DOORS',
                                          text2: doors,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: Utils.Getwidth(context) - 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        fontsize: 16,
                                        fontweight: FontWeight.w500,
                                        text: 'Range',
                                        color: kblack.withOpacity(0.6),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                        fontsize: 19,
                                        fontweight: FontWeight.w600,
                                        text: range,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomText(
                                        fontsize: 16,
                                        fontweight: FontWeight.w500,
                                        text: 'Speed',
                                        color: kblack.withOpacity(0.6),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                        fontsize: 19,
                                        fontweight: FontWeight.w600,
                                        text: speed,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CustomText(
                                        fontsize: 16,
                                        fontweight: FontWeight.w500,
                                        text: "Power",
                                        color: kblack.withOpacity(0.6),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                        fontsize: 19,
                                        fontweight: FontWeight.w600,
                                        text: power,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            CustomText(
                              fontsize: 19,
                              fontweight: FontWeight.w700,
                              text: 'Explore More',
                              color: kblack,
                            ),
                            const SizedBox(
                              height: 22,
                            ),

                            //!-----------------------  vehicle detais with dcuments -----------------------------------//
                            SizedBox(
                              height: 600,
                              child: ListView.separated(
                                itemCount: Car_details.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ExploreMore(
                                    imagename: Car_details[index].imageName,
                                    item: Car_details[index].text1,
                                  );
                                },
                              ),
                            ),

                            // const ExploreMore(
                            //   imagename: '',
                            //   item: '',
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreMore extends StatelessWidget {
  const ExploreMore({
    Key? key,
    required this.imagename,
    required this.item,
  }) : super(key: key);
  final String imagename;
  final String item;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: klightblue,
        width: Utils.Getwidth(context),
        //height: 116,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          fontsize: 15,
                          fontweight: FontWeight.w700,
                          text: item,
                          color: kblack,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CustomSvg(svgname: 'document.svg'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          height: 75,
                          child: CustomText(
                            textAlign: TextAlign.start,
                            fontsize: 12,
                            fontweight: FontWeight.w500,
                            text:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
                            color: kblack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(
                      // width: 170,
                      // height: 75,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Utils.Getimage(imagename),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//?---------------------  vehicel infomation details ----------------------//-s

class Vehicel_info extends StatelessWidget {
  const Vehicel_info({
    Key? key,
    required this.svgname,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String svgname, text1, text2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 65,
      //width: 170,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: CustomSvg(svgname: svgname),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        fontsize: 15,
                        fontweight: FontWeight.w400,
                        text: text1,
                        color: kblack.withOpacity(0.6),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomText(
                        fontsize: 15,
                        fontweight: FontWeight.w600,
                        text: text2,
                        color: kblack.withOpacity(0.6),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
