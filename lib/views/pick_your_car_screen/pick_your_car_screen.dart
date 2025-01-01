// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names, must_be_immutable
import 'package:car_app/views/common_widgets/custom_textField.dart';
import 'package:car_app/views/common_widgets/custome_svg.dart';
import 'package:car_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/data.dart';
import '../common_widgets/custom_appbar.dart';
import '../common_widgets/main_car_slider.dart';

class PickYourCarModel extends StatefulWidget {
  const PickYourCarModel({super.key});

  @override
  State<PickYourCarModel> createState() => _PickYourCarModelState();
}

//final pageControler = PageController();
final suv_pageControler = PageController();
final sedan_pageControler = PageController();
final jeep_pageControler = PageController();
final lorem_pageControler = PageController();
final hatchBack_pageControler = PageController();

int current = 0;

class _PickYourCarModelState extends State<PickYourCarModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.square(60.5),
        child: CustomAppbar(
          leadingSvg: 'back.svg',
          title: 'Pick Your Model',
          actionsSvg: 'menu.svg',
          leadingOnTap: () => Navigator.of(context).pop(),
          actinsOnTap: () {},
        ),
      ),
      //-------------------- boddy Section---------------------------------//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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

              const SizedBox(
                height: 16,
              ),

              //**************Main Slider placing for home screen**************** */

              Maincar_slider(suv_pageControler),
              const SizedBox(
                height: 16,
              ),
              Maincar_slider(sedan_pageControler),
              const SizedBox(
                height: 16,
              ),
              Maincar_slider(jeep_pageControler),
              const SizedBox(
                height: 16,
              ),

              Maincar_slider(lorem_pageControler),
              const SizedBox(
                height: 16,
              ),
              Maincar_slider(hatchBack_pageControler),
              const SizedBox(
                height: 16,
              ),
              // Maincar_slider(pageControler),
              // const SizedBox(
              //   height: 16,
              // ),
            ],
          ),
        ),
      ),
    );
  }

//!------------------ Creating car slider with page indicatopr----------------//
//*************before use the main car slider neet to import the Main Slider------------------- */

  SizedBox Maincar_slider(PageController pagecontroler_) {
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
                      current == pagecontroler_.page;
                    });
                  },
                  controller: pagecontroler_,
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
                  controller: pagecontroler_,
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
