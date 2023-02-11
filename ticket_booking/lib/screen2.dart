import 'screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ticket_booking/CustomWidget/f_details.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background_color
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black87,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          //main_padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Column(
              children: [
                //app_bar
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    height: 65,
                    width: 395,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(
                              MaterialPageRoute(
                                builder: (context) => const Screen1(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 11, right: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'JawaBarat',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'Bali',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '21Dec2022 * 1Passenger,Economy',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          size: 28,
                          Icons.edit_note,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                //Searched_flight_result
                //Tabbar
                const Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: Tabbbar(),
                ),
                //flight_details
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    //flight_details-Card
                    children: [
                      FlightDetails(
                        image: 'f1.jpeg',
                        airlinename: 'IndiGo',
                        DPOtime: '19:30',
                        duratoin: '2h10m',
                        DPStime: '20:40',
                        price: '1,100,000',
                        s_price: '1,300,000',
                        isActive: true,
                      ),
                      FlightDetails(
                        image: 'f2.jpeg',
                        airlinename: 'SpiceJet',
                        DPOtime: '16:30',
                        duratoin: '2h10m',
                        DPStime: '18:40',
                        price: '1,200,000',
                        s_price: '1,500,000',
                        isActive: true,
                      ),
                      FlightDetails(
                        image: 'f3.jpeg',
                        airlinename: 'AirIndia',
                        DPOtime: '19:30',
                        duratoin: '2h10m',
                        DPStime: '20:40',
                        price: '1,500,000',
                        s_price: '2,000,000',
                        isActive: false,
                      ),
                      FlightDetails(
                        image: 'f4.jpeg',
                        airlinename: 'Vistara',
                        DPOtime: '23:30',
                        duratoin: '2h10m',
                        DPStime: '01:40',
                        price: '1,500,000',
                        s_price: '1,800,000',
                        isActive: false,
                      ),
                      FlightDetails(
                        image: 'f1.jpeg',
                        airlinename: 'IndiGo',
                        DPOtime: '19:30',
                        duratoin: '2h10m',
                        DPStime: '20:40',
                        price: '1,100,000',
                        s_price: '1,300,000',
                        isActive: true,
                      ),
                      FlightDetails(
                        image: 'f2.jpeg',
                        airlinename: 'SpiceJet',
                        DPOtime: '16:30',
                        duratoin: '2h10m',
                        DPStime: '18:40',
                        price: '1,200,000',
                        s_price: '1,500,000',
                        isActive: true,
                      ),
                      FlightDetails(
                        image: 'f3.jpeg',
                        airlinename: 'AirIndia',
                        DPOtime: '19:30',
                        duratoin: '2h10m',
                        DPStime: '20:40',
                        price: '1,500,000',
                        s_price: '2,000,000',
                        isActive: false,
                      ),
                      FlightDetails(
                        image: 'f4.jpeg',
                        airlinename: 'Vistara',
                        DPOtime: '23:30',
                        duratoin: '2h10m',
                        DPStime: '01:40',
                        price: '1,500,000',
                        s_price: '1,800,000',
                        isActive: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Floating_bar
          Positioned(
            bottom: 0,
            child: Container(
              height: 70,
              width: 390,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 23.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20.0,
                    offset: Offset(
                      0,
                      5,
                    ),
                  ),
                ],
              ),

              //Icon_Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  const VerticalDivider(
                    indent: 7,
                    endIndent: 6,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.sort,
                        color: Colors.black,
                      ),
                      Text(
                        'Sort',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  const VerticalDivider(
                    indent: 7,
                    endIndent: 6,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.flight_rounded,
                        color: Colors.black,
                      ),
                      Text(
                        'Airline',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tabbbar extends StatefulWidget {
  const Tabbbar({super.key});

  @override
  State<Tabbbar> createState() => _TabbbarState();
}

class _TabbbarState extends State<Tabbbar> {
  List<String> items = [
    "All",
    "Recommended",
    "Free Reshcedule",
    "home",
    "home",
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 5.0,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                current = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 4, right: 4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: current == index ? Colors.teal : Colors.grey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: current == index ? Colors.teal : Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 1.0,
                    left: 1.0,
                    right: 3.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        items[index],
                        style: TextStyle(
                          color: current == index
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
