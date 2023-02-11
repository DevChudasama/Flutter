import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticket_booking/screen2.dart';
import 'package:ticket_booking/CustomWidget/deals.dart';
import 'package:ticket_booking/CustomWidget/r_destination.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  DateTime _dateTime = DateTime.now();
  bool value = false;
  int _selectedItemIndex = 0;

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
          //background_color
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.black87,
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //user_data
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage('assets/images/210360.jpg'),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "GoodMorning,",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                "Dhira Danurta👋",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(
                        size: 25,
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      const Icon(
                        size: 25,
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                //ticket_search-card
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.only(
                    top: 25,
                    bottom: 10.0,
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Tabbbar(),
                        ),
                        //From_to_destination-card
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.flight_takeoff,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          'JawaBarat,indonesia(DPO)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 3.0),
                                      child: Divider(
                                        thickness: 2,
                                        endIndent: 55,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.flight_land,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Bali, Indonesia (DPS)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 6,
                                  right: 3,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        size: 30,
                                        Icons.swap_vert_rounded,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Date card
                        GestureDetector(
                          onTap: _showDate,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.calendar_month_rounded,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  const SizedBox(width: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 85.0),
                                    child: Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(_dateTime),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7.0),
                                    child: Text(
                                      'RoundTrip?',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  buildIOSSwitch(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        //passenger-card
                        Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  '1Passenger,Economy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // //search_button
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 3.0,
                            right: 3.0,
                            top: 16.0,
                            bottom: 10.0,
                          ),
                          child: SizedBox(
                            width: 378,
                            height: 46,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Screen2(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Search Flight',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //offers & destination
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Lotsofbenefitforyou!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    'ViewAll',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 120,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                    children: [
                                      Deals(image: 'tree1.jpg'),
                                      Deals(image: 'tree2.jpg'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        R_Destination(isActive: true),
                      ],
                    ),
                  ),
                ),
              ],
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

  Widget buildIOSSwitch() => Transform.scale(
        scale: 1.0,
        child: CupertinoSwitch(
          activeColor: Colors.teal.withOpacity(0.4),
          // trackColor: Colors.grey.withOpacity(0.5),
          thumbColor: Colors.teal,
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );

  void _showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }
}

class Tabbbar extends StatefulWidget {
  const Tabbbar({super.key});

  @override
  State<Tabbbar> createState() => _TabbbarState();
}

class _TabbbarState extends State<Tabbbar> {
  int current = 0;
  List<Widget> items = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 5.0,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
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
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 1.0,
                  left: 3.0,
                  right: 3.0,
                  // bottom: 2.0,
                ),
                child: Row(
                  children: [
                    items[index],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
