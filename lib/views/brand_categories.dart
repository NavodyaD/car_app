import 'package:flutter/material.dart';

class BrandCategories extends StatefulWidget {
  const BrandCategories({Key? key}) : super(key: key);

  @override
  State<BrandCategories> createState() => _BrandCategoriesState();
}

class _BrandCategoriesState extends State<BrandCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(top: 10, left: 10),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.black,
        // ),
        title: Padding(
          padding: const EdgeInsets.only(left: 0, top: 10),
          child: Text(
            "Models",
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
      body: Column(
        children: [
          // search field
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(14),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     offset: Offset(0, 12),
                //     blurRadius: 16,
                //   )
                // ]
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    hintText: "Search Here",
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  // Sedan ---------------------------------------------------------------
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 61, 61, 61)
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 226, 244, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Sedan',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Sedan Category')
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              height: 100,
                              child: Image.network(
                                  'https://www.freepnglogos.com/uploads/car-png/car-png-request-brochures-guides-mazda-usa-12.png')),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // SUV ---------------------------------------------------------------
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 61, 61, 61)
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 226, 244, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'SUV',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('SUV Category')
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              height: 100,
                              child: Image.network(
                                  'https://picolio.auto123.com/18photo/lexus/2018-lexus-lx-570.png')),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Hatchback -------------------------------------------------------
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 61, 61, 61)
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 226, 244, 255),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hatchback',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Hatchback Category')
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              height: 100,
                              child: Image.network(
                                  'https://purepng.com/public/uploads/large/purepng.com-mitsubishimitsubishimitsubishi-groupmitsubishi-carmitsubishi-automobiles-1701527514910j8gux.png')),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
