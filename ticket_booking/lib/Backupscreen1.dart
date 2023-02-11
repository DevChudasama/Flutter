import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
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
          ),
          Positioned(
            top: 45,
            left: 16,
            right: 16,
            // bottom: 385,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: const CircleAvatar(
                        radius: 21,
                        backgroundImage: AssetImage('images/210360.jpg'),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GoodMorning,",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const Text(
                            "DhiraDanurta👋",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 16),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(8),
                //         color: Colors.yellow,
                //       ),
                //     ),
                //   ),
                // ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  // color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(8),
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.flight_takeoff),
                                    SizedBox(width: 10),
                                    Text('Flights')
                                  ],
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.train,
                                      color: Colors.grey.shade700,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'trains',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Card(
                                child: Row(
                                  children: [
                                    Icon(Icons.directions_bus),
                                    Text('Flights')
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Card(
                                child: Row(
                                  children: [
                                    Icon(Icons.airplanemode_active),
                                    Text('Flights')
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Card(
                                child: Row(
                                  children: [
                                    Icon(Icons.airplanemode_active),
                                    Text('Flights')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.flight_takeoff),
                                          SizedBox(width: 10),
                                          Text('JawaBarat,indonesia(BDO)'),
                                        ],
                                      ),
                                      Container(),
                                      Row(
                                        children: [
                                          Icon(Icons.flight_land),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('JawaBarat,indonesia(BDO)'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.calendar_month),
                                      SizedBox(width: 10),
                                      Text('21Dec2022'),
                                      SizedBox(width: 150),
                                      Text('RoundTrip?')
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person_rounded),
                                      SizedBox(width: 10),
                                      Text('1Passenger,Economy'),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    minimumSize: const Size.fromHeight(40),
                                  ),
                                  child: Text(
                                    'Search Flight',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 450,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Lotsofbenefitforyou!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 200),
                            Text(
                              'ViewAll',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Image.asset(
                            'images/Z.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text('hello'),
                    color: Colors.green,
                  ),
                  Container(
                    child: Text('hello'),
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//   MaterialStateProperty<Color>? getColor(Color color, Color colorPressed) {
//     final getColor = (Set<MaterialState> states) {
//       if (states.contains(MaterialState.pressed)) {
//         return colorPressed;
//       } else {
//         return color;
//       }
//     };
//     return MaterialStateProperty.resolveWith(getColor);
//   }
}

// style: ElevatedButton.styleFrom(
//   side: BorderSide(color: Colors.grey),
// ),

// Positioned(
// top: 445,
// left: 10,
// child: Padding(
// padding: const EdgeInsets.only(
// top: 8,
// left: 8,
// right: 8,
// ),
// child: Column(
// children: [
// Container(
// child: Column(
// children: [
// Row(
// children: const [
// Text(
// 'Lotsofbenefitforyou!',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 15,
// ),
// ),
// SizedBox(width: 185),
// Text(
// 'ViewAll',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 15,
// color: Colors.teal,
// ),
// ),
// ],
// ),
// SizedBox(height: 10),
// Container(
// height: 200,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(200),
// ),
// child: Image.asset(
// 'images/Z.jpg',
// fit: BoxFit.fitWidth,
// ),
// ),
// ],
// ),
// ),
// Container(
// child: Text('hello'),
// color: Colors.green,
// ),
// Container(
// child: Text('hello'),
// color: Colors.yellow,
// ),
// ],
// ),
// ),
// ),
