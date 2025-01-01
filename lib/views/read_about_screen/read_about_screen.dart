// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names, must_be_immutable
import 'package:car_app/utils/utilfunction.dart';
import 'package:car_app/views/car_detail_screen/car_details_screen.dart';
import 'package:car_app/views/common_widgets/custom_textField.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/views/common_widgets/populer_car_mode.dart';
import 'package:car_app/views/home_sample.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/car_brand_model.dart';
import '../../model/popuer_car_modle.dart';
import '../common_widgets/car_brand_selector.dart';
import '../common_widgets/custom_appbar.dart';

class ReadAboutCars extends StatefulWidget {
  const ReadAboutCars({super.key});

  @override
  State<ReadAboutCars> createState() => _ReadAboutCarsState();
}

int current = 0;

class _ReadAboutCarsState extends State<ReadAboutCars> {
  String car_name = '';

  final Stream<QuerySnapshot> cars =
      FirebaseFirestore.instance.collection('cars').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.square(60.5),
        child: CustomAppbar(
          leadingSvg: 'back.svg',
          title: 'Read About Cars',
          actionsSvg: 'menu.svg',
          leadingOnTap: () => Navigator.of(context).pop(),
          actinsOnTap: () {},
        ),
      ),
      //-------------------- boddy Section---------------------------------//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: Utils.Getwidth(context),
          height: Utils.Getheight(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 5, left: 0, right: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 239, 239),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            car_name = val;
                          });
                        },
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          hintText: "Search cars",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),

                const SizedBox(
                  height: 20,
                ),
                //!--*********--------  vehicele brand selector-------------------******************//
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: car_brand_detail.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CarBrandSelector(
                            brand_name_: car_brand_detail[index].brand_name,
                            is_selected_: car_brand_detail[index].isSelect,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //**********************  item grid for vehicel models---------------- *//
                Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: cars,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading...');
                        }
                        final data = snapshot.requireData;

                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 7,
                          ),
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            if (car_name.isEmpty) {
                              return GridTile(
                                child: SizedBox(
                                  width: 150,
                                  height: 250,
                                  child: Populer_Car_Model(
                                    actinsOnTap: () =>
                                        Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => CarDetailsScreen(
                                          car_name:
                                              "${data.docs[index]['car_name']}",
                                          year: "${data.docs[index]['year']}",
                                          description:
                                              "${data.docs[index]['description']}",
                                          fuel: "${data.docs[index]['fuel']}",
                                          seats: "${data.docs[index]['seats']}",
                                          transmission:
                                              "${data.docs[index]['transmission']}",
                                          doors: "${data.docs[index]['doors']}",
                                          range: "${data.docs[index]['range']}",
                                          speed: "${data.docs[index]['speed']}",
                                          power: "${data.docs[index]['power']}",
                                          cover_image:
                                              "${data.docs[index]['cover_image']}",
                                        ),
                                      ),
                                    ),
                                    carModel: "${data.docs[index]['car_name']}",
                                    yom: "${data.docs[index]['year']}",
                                    carDiscription:
                                        "${data.docs[index]['short_description']}",
                                    imageName:
                                        "${data.docs[index]['image_path']}",
                                    islike: false,
                                  ),
                                ),
                              );
                            }
                            if (data.docs[index]['car_name']
                                .toString()
                                .toLowerCase()
                                .startsWith(car_name.toLowerCase())) {
                              return GridTile(
                                child: SizedBox(
                                  width: 150,
                                  height: 250,
                                  child: Populer_Car_Model(
                                    actinsOnTap: () =>
                                        Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => CarDetailsScreen(
                                          car_name:
                                              "${data.docs[index]['car_name']}",
                                          year: "${data.docs[index]['year']}",
                                          description:
                                              "${data.docs[index]['description']}",
                                          fuel: "${data.docs[index]['fuel']}",
                                          seats: "${data.docs[index]['seats']}",
                                          transmission:
                                              "${data.docs[index]['transmission']}",
                                          doors: "${data.docs[index]['doors']}",
                                          range: "${data.docs[index]['range']}",
                                          speed: "${data.docs[index]['speed']}",
                                          power: "${data.docs[index]['power']}",
                                          cover_image:
                                              "${data.docs[index]['cover_image']}",
                                        ),
                                      ),
                                    ),
                                    carModel: "${data.docs[index]['car_name']}",
                                    yom: "${data.docs[index]['year']}",
                                    carDiscription:
                                        "${data.docs[index]['short_description']}",
                                    imageName:
                                        "${data.docs[index]['image_path']}",
                                    islike: false,
                                  ),
                                ),
                              );
                            }
                            return Container();
                          },
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
