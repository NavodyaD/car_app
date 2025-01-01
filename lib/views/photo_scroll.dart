import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:blur/blur.dart';

final pageControler = PageController();
int current = 0;

class PhotoScroll extends StatefulWidget {
  const PhotoScroll({Key? key}) : super(key: key);

  @override
  State<PhotoScroll> createState() => _PhotoScrollState();
}

class _PhotoScrollState extends State<PhotoScroll> {
  final Stream<QuerySnapshot> gallery =
      FirebaseFirestore.instance.collection('gallery').snapshots();

  // Testing List -----------------------------------

  List<Image_Slider_Details> Image_details = [
    Image_Slider_Details(
      image_Path:
          'https://cdn.nettiauto.com/live/2022/09/26/4f62808932c8630c-medium.jpg',
    ),
    Image_Slider_Details(
      image_Path:
          'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    ),
    Image_Slider_Details(
      image_Path:
          'https://www.enwallpaper.com/wp-content/uploads/33399f43d8336dcfcc3673f05abb501c.jpg',
    ),
    Image_Slider_Details(
      image_Path:
          'https://w0.peakpx.com/wallpaper/120/1014/HD-wallpaper-nissan-gtr-nissan-gtr-car-supercar-sports-america-new-jdm-thumbnail.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: ScreenHeight,
        width: ScreenWidth,
        child: StreamBuilder<QuerySnapshot>(
            stream: gallery,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              }
              final data = snapshot.requireData;

              return PageView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: data.size,
                onPageChanged: (value) {
                  setState(() {
                    current == pageControler.page;
                  });
                },
                controller: pageControler,
                itemBuilder: (context, index) {
                  return ScrollImageWidget(
                      car_name: "${data.docs[index]['car_name']}",
                      img_path: "${data.docs[index]['img_path']}",
                      year: "${data.docs[index]['year']}");
                },
              );
            }),
      ),
    );
  }
}

// Testing -------------------

class Image_Slider_Details {
  Image_Slider_Details({
    required this.image_Path,
  });

  final String image_Path;
}

// Scroll Widget (Custom Widget) --------------------------

class ScrollImageWidget extends StatelessWidget {
  const ScrollImageWidget(
      {Key? key,
      required this.car_name,
      required this.img_path,
      required this.year});

  final String car_name;
  final String img_path;
  final String year;

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);
    return Container(
      height: ScreenHeight,
      width: ScreenWidth,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(img_path), fit: BoxFit.cover)),
            height: ScreenHeight,
            width: ScreenWidth,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: NetworkImage(img_path), fit: BoxFit.cover)),
            height: ScreenHeight,
            width: ScreenWidth,
            child: Image.network(
              img_path,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: ScreenHeight,
            width: ScreenWidth,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(bottom: 30, left: 15),
            child: Row(
              children: [
                Text(
                  car_name + '  ',
                  style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  year,
                  style: TextStyle(
                      color: Color.fromARGB(255, 218, 218, 218), fontSize: 17),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



// PageView.builder(
//             scrollDirection: Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//             itemCount: Image_details.length,
//             onPageChanged: (value) {
//               setState(() {
//                 current == pageControler.page;
//               });
//             },
//             controller: pageControler,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: ScreenWidth,
//                 height: ScreenHeight,
//                 child: Image.network(
//                   Image_details[index].image_Path,
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           ),

// car_name: "${data.docs[index]['car_name']}",