import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget(
      {required this.titleText,
      required this.newsContent,
      required this.imagePath,
      this.onTapFunction});
  final String titleText;
  final String newsContent;
  final String imagePath;
  Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        GestureDetector(
          onTap: onTapFunction,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 200,
              minHeight: 130,
            ),
            height: 180,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 78, 78, 78).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    padding: const EdgeInsets.only(
                        top: 20, left: 18, bottom: 20, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            titleText,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          newsContent,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(imagePath), fit: BoxFit.cover)),
                    height: double.infinity,
                    //height: double.infinity,
                    // child: Image.network(
                    //   'https://www.dogusoto.com.tr/Dosyalar/Model/PORSCHE/galeri%20g%C3%B6rseli/macan/porsche-macan-my2021-22.jpg',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
