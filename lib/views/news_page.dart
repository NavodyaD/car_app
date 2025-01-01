import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final pageControler = PageController();
int current = 0;

class News_Page extends StatefulWidget {
  News_Page(
      {Key? key,
      required this.main_title,
      required this.sub_title,
      required this.news_description,
      required this.image_1,
      required this.image_2,
      required this.image_3,
      required this.image_4});

  final String main_title;
  final String sub_title;
  final String news_description;
  final String image_1;
  final String image_2;
  final String image_3;
  final String image_4;

  @override
  State<News_Page> createState() => _News_PageState(
      main_title: main_title,
      sub_title: sub_title,
      news_description: news_description,
      image_1: image_1,
      image_2: image_2,
      image_3: image_3,
      image_4: image_4);
}

final List<String> imgList = [
  'https://www.jamesedition.com/stories/wp-content/uploads/2020/07/Aperta2.jpg',
  'https://cdn.motor1.com/images/mgl/oemzp/s1/2020-ferrari-812-gts.jpg',
  'https://d.newsweek.com/en/full/2060160/ferrari-f8-spider.jpg'
];

String news_content =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ';

class _News_PageState extends State<News_Page> {
  _News_PageState(
      {Key? key,
      required this.main_title,
      required this.sub_title,
      required this.news_description,
      required this.image_1,
      required this.image_2,
      required this.image_3,
      required this.image_4});

  final String main_title;
  final String sub_title;
  final String news_description;
  final String image_1;
  final String image_2;
  final String image_3;
  final String image_4;

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);

    // Images for image slider

    List<Image_Slider_Details> Image_details = [
      Image_Slider_Details(
        image_Path: image_1,
      ),
      Image_Slider_Details(
        image_Path: image_2,
      ),
      Image_Slider_Details(
        image_Path: image_3,
      ),
      Image_Slider_Details(
        image_Path: image_4,
      ),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(top: 15, left: 20),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Stack(children: [
              Container(
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: SizedBox(
                  width: 38,
                  height: 38,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Stack(children: [
                Container(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: SizedBox(
                    width: 38,
                    height: 38,
                    child: Icon(
                      Icons.menu_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Stack(children: [
              SizedBox(
                height: 400,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Image_details.length,
                  onPageChanged: (value) {
                    setState(() {
                      current == pageControler.page;
                    });
                  },
                  controller: pageControler,
                  itemBuilder: (context, index) {
                    return Container(
                      width: ScreenWidth,
                      height: 300,
                      child: Image.network(
                        Image_details[index].image_Path,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 400,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SmoothPageIndicator(
                    controller: pageControler,
                    count: Image_details.length,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 6.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 1.5,
                        dotColor: Color.fromARGB(255, 255, 255, 255),
                        activeDotColor: Color.fromARGB(255, 206, 206, 206)),
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      main_title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      sub_title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      news_description,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Images for slider

class Image_Slider_Details {
  Image_Slider_Details({
    required this.image_Path,
  });

  final String image_Path;
}
