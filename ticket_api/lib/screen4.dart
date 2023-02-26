import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticket_api/CustomWidget/popular_place.dart';
import 'package:ticket_api/CustomWidget/r_destination.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  int _selectedItemIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          BottomNavbar(CupertinoIcons.home, 'Home', 0),
          BottomNavbar(CupertinoIcons.map, 'Discover', 1),
          BottomNavbar(CupertinoIcons.ticket, 'Ticket', 2),
          BottomNavbar(CupertinoIcons.bookmark, 'Saved', 3),
          BottomNavbar(CupertinoIcons.person, 'Profile', 4),
        ],
      ),
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
                flex: 2,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),

          //main_Padding
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<http.Response>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      //location_Row
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0, bottom: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  size: 30,
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 14),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'YourLocation',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        jsonDecode(snapshot.data!.body
                                                .toString())[0]['From']
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Change',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              size: 28,
                              CupertinoIcons.search,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      //nearest_transportation
                      Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 20.0,
                              offset: Offset(
                                0,
                                -8,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Nearest transportation',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.info_outline_rounded),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Tabbbar(),
                            const SizedBox(height: 8),
                            // location_image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                              child: Image.asset(
                                'assets/images/ticket_31.jpg',
                                fit: BoxFit.cover,
                                height: 180,
                                width: 392,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //ListView
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Popular_place(isActive: false),
                              R_Destination(isActive: false),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: getData(),
            ),
          ),
        ],
      ),
    );
  }

  Widget BottomNavbar(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedItemIndex
            ? const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: Colors.green,
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0x36d8ffd8), //light
                    Color(0x1a70ff3d), //dark
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerLeft,
                ),
              )
            : const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Icon(
                icon,
                color: index == _selectedItemIndex ? Colors.teal : Colors.grey,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      index == _selectedItemIndex ? Colors.teal : Colors.grey,
                ),
              )
            ],
          ),
        ),
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
  List<Widget> items = [
    const Text(
      'All',
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    Row(
      children: const [
        Icon(
          CupertinoIcons.airplane,
        ),
        SizedBox(width: 10),
        Text(
          'Flights',
        ),
      ],
    ),
    Row(
      children: const [
        Icon(CupertinoIcons.tram_fill),
        SizedBox(width: 6),
        Text('Train'),
      ],
    ),
    Row(
      children: const [
        Icon(CupertinoIcons.bus),
        SizedBox(width: 6),
        Text('Bus'),
      ],
    ),
    Row(
      children: const [
        Icon(CupertinoIcons.car_detailed),
        SizedBox(width: 6),
        Text('Cars'),
      ],
    ),
    Row(
      children: const [
        FaIcon(FontAwesomeIcons.ship),
        SizedBox(width: 8),
        Text('Ship'),
      ],
    ),
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
                      items[index],
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
