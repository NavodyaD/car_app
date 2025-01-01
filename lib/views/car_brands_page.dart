import 'package:car_app/views/brand_categories.dart';
import 'package:car_app/views/common_widgets/car_brand_widget.dart';
import 'package:car_app/views/common_widgets/news_widget.dart';
import 'package:car_app/views/news_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Car_Brands_Page extends StatefulWidget {
  const Car_Brands_Page({Key? key}) : super(key: key);

  @override
  State<Car_Brands_Page> createState() => _Car_Brands_PageState();
}

class _Car_Brands_PageState extends State<Car_Brands_Page> {
  String news_title = '';

  final Stream<QuerySnapshot> news =
      FirebaseFirestore.instance.collection('news').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // leading: Icon(
        //   Icons.arrow_back_ios_new_rounded,
        //   color: Colors.black,
        // ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "Brands",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),

      //body
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 5, left: 0, right: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      news_title = val;
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
                    hintText: "Search Brands",
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              onTapFunction: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BrandCategories(),
                                    ),
                                  ),
                              brand_name: 'BMW',
                              logo_path:
                                  'https://cdn.pixabay.com/photo/2016/08/15/18/18/bmw-1596080__480.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              onTapFunction: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BrandCategories(),
                                    ),
                                  ),
                              brand_name: 'Ford',
                              logo_path:
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Ford-Motor-Company-Logo.png/1200px-Ford-Motor-Company-Logo.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              onTapFunction: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BrandCategories(),
                                    ),
                                  ),
                              brand_name: 'Lamborghini',
                              logo_path:
                                  'https://www.carlogos.org/car-logos/lamborghini-logo-1100x1200.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              onTapFunction: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BrandCategories(),
                                    ),
                                  ),
                              brand_name: 'Rolls Royce',
                              logo_path:
                                  'https://www.carlogos.org/logo/Rolls-Royce-logo-2048x2048.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              brand_name: 'Mercedes',
                              logo_path:
                                  'https://logodownload.org/wp-content/uploads/2014/04/mercedes-benz-logo-1-1.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              brand_name: 'Land Rover',
                              logo_path:
                                  'https://upload.wikimedia.org/wikipedia/en/thumb/4/4a/LandRover.svg/1200px-LandRover.svg.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              brand_name: 'Jeep',
                              logo_path:
                                  'https://logos-world.net/wp-content/uploads/2021/09/Jeep-Logo.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Car_Brand_Widget(
                              brand_name: 'Audi',
                              logo_path:
                                  'https://www.carlogos.org/car-logos/audi-logo-1985.png',
                              short_description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
