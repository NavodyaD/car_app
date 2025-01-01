// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names, must_be_immutable
import 'package:car_app/model/car_brand_model.dart';
import 'package:car_app/model/data.dart';
import 'package:car_app/views/common_widgets/car_brand_selector.dart';
import 'package:car_app/views/common_widgets/custom_appbar2.dart';
import 'package:car_app/views/common_widgets/custom_text.dart';
import 'package:car_app/views/common_widgets/custom_textField.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/colors.dart';
import 'package:car_app/views/gallery_page.dart';
import 'package:car_app/views/pick_your_car_screen/pick_your_car_screen.dart';
import 'package:car_app/views/read_about_screen/read_about_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/popuer_car_modle.dart';
import '../common_widgets/custom_appbar.dart';
import '../common_widgets/main_car_slider.dart';
import '../common_widgets/populer_car_mode.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1592198084033-aade902d1aae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
  'http://alwaahidrentacar.com/wp-content/uploads/2017/01/CFFF337A-5328-4288-BDE3-BF04E6BFF9DA.jpeg',
  'https://s1.cdn.autoevolution.com/images/news/2019-audi-r8-v10-performance-looks-brutal-in-yellow-130641_1.jpg',
  'https://www.topgear.com/sites/default/files/images/cars-road-test/2019/08/f7c8b3c3422aa676314bc4209a44b39c/large-33263-mercedes-amggtrpro.jpg'
];

final pageControler = PageController();
int current = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> gallery =
      FirebaseFirestore.instance.collection('gallery').snapshots();

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = (MediaQuery.of(context).size.height);
    double ScreenWidth = (MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            'The Super Car Owner',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
      //-------------------- boddy Section---------------------------------//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomeTextField(
                hint_Text: 'Search your car',
                hintfontsize: 16,
                hinttextcolor: kgrayCollor,
                textAlign: TextAlign.center,
                textfield_boderradious: 10,
                textfield_boderside_color: kgrayCollor,
                enabled_textfield_boderside_color: Colors.transparent,
                facused_textfield_boderside_color: kgrayCollor,
                focusedBorderRadious: 10,
                suffixwidget: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: CustomSvg(svgname: 'filter.svg'),
                  ),
                ),
                preffixiconwidget: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: CustomSvg(svgname: 'search.svg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'Cars Gallery',
                    fontsize: 17,
                    fontweight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GalleryPage(),
                          ),
                        )),
                    child: CustomText(
                      text: 'View All',
                      fontweight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 260,
                width: ScreenWidth,
                child: CarouselSlider(
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                //width: 500,
                                height: 250,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    aspectRatio: 0.9,
                    //autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'Pick Your Model',
                    fontsize: 17,
                    fontweight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PickYourCarModel(),
                          ),
                        )),
                    child: CustomText(
                      text: 'View All',
                      fontweight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              //*****Main Slider placing for home screen***** */

              Maincar_slider(),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  //textAlign: TextAlign.start,
                  text: 'Popular',
                  fontsize: 17,
                  fontweight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 230,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Populer_Car_details.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Populer_Car_Model(
                          carModel: Populer_Car_details[index].model,
                          yom: Populer_Car_details[index].yom,
                          carDiscription:
                              Populer_Car_details[index].discreption,
                          imageName: Populer_Car_details[index].image,
                          islike: Populer_Car_details[index].isLike,
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: 'Read About Cars',
                    fontsize: 17,
                    fontweight: FontWeight.w600,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReadAboutCars(),
                      ),
                    ),
                    child: CustomText(
                      text: 'View All',
                      fontweight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //!--***--------  vehicele brand selector-------------------******//
              SizedBox(
                child: SizedBox(
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
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 230,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Populer_Car_details.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Populer_Car_Model(
                          carModel: Populer_Car_details[index].model,
                          yom: Populer_Car_details[index].yom,
                          carDiscription:
                              Populer_Car_details[index].discreption,
                          imageName: Populer_Car_details[index].image,
                          islike: Populer_Car_details[index].isLike,
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
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.deepPurple[200],
                child: Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }

//!------------------ Creating car slider with page indicatopr----------------//
//*****before use the main car slider neet to import the Main Slider------------------- */

  SizedBox Maincar_slider() {
    return SizedBox(
      height: 196,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          color: klightblue,
          elevation: 2,
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Car_details.length,
                  onPageChanged: (value) {
                    setState(() {
                      current == pageControler.page;
                    });
                  },
                  controller: pageControler,
                  itemBuilder: (context, index) {
                    return Main_slider(
                      text1: Car_details[index].text1,
                      text2: Car_details[index].text2,
                      text3: Car_details[index].text3,
                      imgname: Car_details[index].imageName,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SmoothPageIndicator(
                  controller: pageControler,
                  count: Car_details.length,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 6.0,
                      dotHeight: 6.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
