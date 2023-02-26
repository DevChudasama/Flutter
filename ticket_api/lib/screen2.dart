import 'package:intl/intl.dart';
import 'add_user_page.dart';
import 'screen1.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ticket_api/CustomWidget/f_details.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  DateTime _dateTime = DateTime.now();

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
            child: FutureBuilder<http.Response>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      //app_bar
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 42.0,
                          left: 4,
                          right: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                const SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          jsonDecode(snapshot.data!.body
                                                  .toString())[0]['From']
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        const Icon(
                                          Icons.arrow_right_alt_rounded,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          jsonDecode(snapshot.data!.body
                                                  .toString())[0]['To']
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          DateFormat('dd MMM yyyy')
                                              .format(_dateTime),
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ' * 1Passenger,Economy',
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              size: 28,
                              Icons.edit_note,
                              color: Colors.white,
                            ),
                          ],
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
                        child: FlightDetails(),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: getData(),
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
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => AddUser(null),
                            ),
                          )
                              .then(
                            (value) {
                              setState(() {
                                getData();
                              });
                            },
                          );
                        },
                        child: const Icon(
                          Icons.flight_rounded,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Airline["ADD"]',
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

Future<http.Response> getData() async {
  var response = await http
      .get(Uri.parse("https://63f8df141dc21d5465c9921c.mockapi.io/main"));
  // print(response.body.toString());

  return response;
}
