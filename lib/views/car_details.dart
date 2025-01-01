import 'package:car_app/views/360_car_view.dart';
import 'package:flutter/material.dart';

class Car_Details extends StatefulWidget {
  const Car_Details({Key? key}) : super(key: key);

  @override
  State<Car_Details> createState() => _Car_DetailsState();
}

class _Car_DetailsState extends State<Car_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              AppBar(
                leading: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                title: Text(
                  "Car Detail",
                  style: TextStyle(color: Colors.black),
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
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                  "https://media.wired.com/photos/5927284ff3e2356fd800b9b4/master/pass/03_CHIRON_34-front_WEB.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              //car description
              Container(
                child: Column(
                  children: [
                    //name & 3D view button
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bugatti Divo ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //navigate to 3D view page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const carView_screen()),
                                );
                              },
                              child: Text("360 View"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "2019 Model",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),

                    //description

                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "Automobiles Ettore Bugatti was a German then French \nmanufacturer of high-performance automobiles. \nThe company was founded in 1909 in the then-\nGerman city of Molsheim, Alsace, by the \nItalian-born industrial designer Ettore Bugatti. \nThe cars were known for their design beauty"),
                          )
                        ],
                      ),
                    ),

                    //icons with car dtls

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.oil_barrel_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("FUEL"), Text("Diesel")],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.event_seat_sharp),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("SEATS"), Text("4")],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("TRANSMISSION"),
                                      Text("AUTO")
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.door_sliding_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("DOORS"), Text("4")],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text("Range"),
                                  SizedBox(height: 10),
                                  Text(
                                    "500mil",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text("Speed"),
                                  SizedBox(height: 10),
                                  Text("200kmH",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text("Power"),
                                  SizedBox(height: 10),
                                  Text("4500wh",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),

                    //explore more cars
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Explore More",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),

                    // car cards
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        child: Column(
                          children: [
                            //card1
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.9,
                                color: Colors.blue.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Item 1",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.note_alt_rounded,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Text(
                                            "The Mitsubishi Lancer \nEvolution, popularly referred \nto as the 'Evo' is a sports \nsedan and rally car ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 2),
                                          // Image.network("https://cdn5.vectorstock.com/i/1000x1000/86/34/cartoon-car-isolated-on-white-background-vector-11408634.jpg",width: MediaQuery.of(context).size.width * 0.001,height: MediaQuery.of(context).size.height*0.001,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            //car2

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.9,
                                color: Colors.blue.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Item 2",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.note_alt_rounded,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Text(
                                            "The Mitsubishi Lancer \nEvolution, popularly referred \nto as the 'Evo' is a sports \nsedan and rally car ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 2),
                                          // Image.network("https://cdn5.vectorstock.com/i/1000x1000/86/34/cartoon-car-isolated-on-white-background-vector-11408634.jpg",width: MediaQuery.of(context).size.width * 0.001,height: MediaQuery.of(context).size.height*0.001,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            //car3

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.9,
                                color: Colors.blue.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Item 3",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.note_alt_rounded,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Text(
                                            "The Mitsubishi Lancer \nEvolution, popularly referred \nto as the 'Evo' is a sports \nsedan and rally car ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 2),
                                          // Image.network("https://cdn5.vectorstock.com/i/1000x1000/86/34/cartoon-car-isolated-on-white-background-vector-11408634.jpg",width: MediaQuery.of(context).size.width * 0.001,height: MediaQuery.of(context).size.height*0.001,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            //car4
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.9,
                                color: Colors.blue.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Item 1",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.note_alt_rounded,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Text(
                                            "The Mitsubishi Lancer \nEvolution, popularly referred \nto as the 'Evo' is a sports \nsedan and rally car ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 2),
                                          // Image.network("https://cdn5.vectorstock.com/i/1000x1000/86/34/cartoon-car-isolated-on-white-background-vector-11408634.jpg",width: MediaQuery.of(context).size.width * 0.001,height: MediaQuery.of(context).size.height*0.001,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
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
