import 'package:car_app/views/photo_scroll.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/utilfunction.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String car_name = '';

  final Stream<QuerySnapshot> gallery =
      FirebaseFirestore.instance.collection('gallery').snapshots();

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Gallery',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 5, left: 0, right: 0),
            child: Container(
              width: ScreenWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      car_name = val;
                    });
                  },
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
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
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                alignment: Alignment.center,
                width: ScreenWidth,
                height: ScreenHeight,
                child: Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: gallery,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading...');
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
                                  height: 250,
                                  width: ScreenWidth / 2 - 20,
                                  child: ImageWidget1(
                                    onTapFunction: () =>
                                        Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PhotoScroll(),
                                      ),
                                    ),
                                    car_name: "${data.docs[index]['car_name']}",
                                    img_path: "${data.docs[index]['img_path']}",
                                    year: "${data.docs[index]['year']}",
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
                                  height: 250,
                                  width: ScreenWidth / 2 - 20,
                                  child: ImageWidget1(
                                    onTapFunction: () =>
                                        Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PhotoScroll(),
                                      ),
                                    ),
                                    car_name: "${data.docs[index]['car_name']}",
                                    img_path: "${data.docs[index]['img_path']}",
                                    year: "${data.docs[index]['year']}",
                                  ),
                                ),
                              );
                            }
                            return Container();
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget1 extends StatelessWidget {
  ImageWidget1(
      {Key? key,
      required this.car_name,
      required this.img_path,
      required this.year,
      this.onTapFunction});

  final String car_name;
  final String img_path;
  final String year;
  Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);
    return Container(
      width: ScreenWidth / 2 - 20,
      height: 180,
      child: GestureDetector(
        onTap: onTapFunction,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                img_path,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(left: 5, bottom: 5),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    car_name + ' ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    year,
                    style: TextStyle(color: Color.fromARGB(255, 201, 201, 201)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
