import 'package:car_app/views/common_widgets/news_widget.dart';
import 'package:car_app/views/news_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class News_screen extends StatefulWidget {
  const News_screen({Key? key}) : super(key: key);

  @override
  State<News_screen> createState() => _News_screenState();
}

class _News_screenState extends State<News_screen> {
  String news_title = '';

  final Stream<QuerySnapshot> news =
      FirebaseFirestore.instance.collection('news').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "News",
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
      body: SingleChildScrollView(
        //scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 5, left: 20, right: 20),
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
                      hintText: "Search latest news",
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, right: 20, left: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: news,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                      //scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        if (news_title.isEmpty) {
                          return NewsWidget(
                            titleText: "${data.docs[index]['news_title']}",
                            newsContent: "${data.docs[index]['news_content']}",
                            imagePath: "${data.docs[index]['image_path']}",
                            onTapFunction: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => News_Page(
                                  main_title:
                                      "${data.docs[index]['main_title']}",
                                  sub_title: "${data.docs[index]['sub_title']}",
                                  news_description:
                                      "${data.docs[index]['news_description']}",
                                  image_1: "${data.docs[index]['image_1']}",
                                  image_2: "${data.docs[index]['image_2']}",
                                  image_3: "${data.docs[index]['image_3']}",
                                  image_4: "${data.docs[index]['image_4']}",
                                ),
                              ),
                            ),
                          );
                        }
                        if (data.docs[index]['news_title']
                            .toString()
                            .toLowerCase()
                            .startsWith(news_title.toLowerCase())) {
                          return NewsWidget(
                            titleText: "${data.docs[index]['news_title']}",
                            newsContent: "${data.docs[index]['news_content']}",
                            imagePath: "${data.docs[index]['image_path']}",
                            onTapFunction: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => News_Page(
                                  main_title:
                                      "${data.docs[index]['main_title']}",
                                  sub_title: "${data.docs[index]['sub_title']}",
                                  news_description:
                                      "${data.docs[index]['news_description']}",
                                  image_1: "${data.docs[index]['image_1']}",
                                  image_2: "${data.docs[index]['image_2']}",
                                  image_3: "${data.docs[index]['image_3']}",
                                  image_4: "${data.docs[index]['image_4']}",
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      });
                },
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            //   child: Container(
            //     constraints: BoxConstraints(
            //       maxHeight: 200,
            //       minHeight: 130,
            //     ),
            //     height: 150,
            //     decoration: BoxDecoration(boxShadow: [
            //       BoxShadow(
            //         color: Color.fromARGB(255, 78, 78, 78).withOpacity(0.3),
            //         spreadRadius: 2,
            //         blurRadius: 5,
            //         offset: Offset(0, 2), // changes position of shadow
            //       ),
            //     ], borderRadius: BorderRadius.all(Radius.circular(20))),
            //     child: Row(
            //       children: [
            //         Flexible(
            //           flex: 5,
            //           child: Container(
            //             height: double.infinity,
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(20),
            //                     bottomLeft: Radius.circular(20))),
            //             padding: const EdgeInsets.only(
            //                 top: 20, left: 18, bottom: 20, right: 10),
            //             child: Column(
            //               children: [
            //                 Container(
            //                   alignment: Alignment.centerLeft,
            //                   child: Text(
            //                     'Latest News 1',
            //                     style: TextStyle(
            //                         fontSize: 16, fontWeight: FontWeight.w500),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 10,
            //                 ),
            //                 Text(
            //                   'Lorem ipsum dolor sit a, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et  magna aliqua.',
            //                   style: TextStyle(
            //                       fontSize: 13, fontWeight: FontWeight.w300),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //         Flexible(
            //           flex: 4,
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.only(
            //                     topRight: Radius.circular(20),
            //                     bottomRight: Radius.circular(20)),
            //                 image: DecorationImage(
            //                     image: NetworkImage(
            //                         'https://www.dogusoto.com.tr/Dosyalar/Model/PORSCHE/galeri%20g%C3%B6rseli/macan/porsche-macan-my2021-22.jpg'),
            //                     fit: BoxFit.cover)),
            //             height: double.infinity,
            //             //height: double.infinity,
            //             // child: Image.network(
            //             //   'https://www.dogusoto.com.tr/Dosyalar/Model/PORSCHE/galeri%20g%C3%B6rseli/macan/porsche-macan-my2021-22.jpg',
            //             //   fit: BoxFit.cover,
            //             // ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
