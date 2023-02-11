import 'screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticket_booking/screen4.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                //Baoarding_pass_row
                Padding(
                  padding: const EdgeInsets.only(top: 17.0, right: 2.0),
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
                                builder: (context) => const Screen2(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'BoardingPass',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                //Ticket_Card
                Container(
                  height: 668,
                  margin:
                      const EdgeInsets.only(top: 18.0, left: 3.0, right: 3.0),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20.0,
                        offset: Offset(
                          0,
                          -2,
                        ),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        //Flight_name
                        SizedBox(
                          height: 40,
                          width: 355,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/airline_logo/f1.jpeg',
                                width: 26,
                                height: 26,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 140),
                                child: Column(
                                  children: const [
                                    Text(
                                      'IndiGo',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'SA-157',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text('ECONOMY CLASS'),
                            ],
                          ),
                        ),
                        //DPO-DPS-Con
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          width: 360,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 18,
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.flight_takeoff),
                                        Expanded(
                                          child: VerticalDivider(
                                            indent: 8,
                                            endIndent: 8,
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(Icons.flight_takeoff),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 12,
                                    right: 72,
                                    top: 3,
                                  ),
                                  height: 180,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'DPO',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 23,
                                              color: Colors.teal,
                                            ),
                                          ),
                                          Text(
                                            'Husein Sastra Negara',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Terminal 1A Domestic',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'DPS',
                                            style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.teal,
                                            ),
                                          ),
                                          Text(
                                            'IGusti Ngurah Rai',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Terminal 2A Domestic',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 155,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            '19:30',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            '21 Dec 2022',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Text(
                                            '20:40',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            '21 Dec 2022',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Name & Ticket_num
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 7.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 16.0,
                                    left: 8.0,
                                    right: 55.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(CupertinoIcons.person),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Danuarta / Dhira',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 7.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 16.0,
                                    left: 16.0,
                                    right: 65.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(CupertinoIcons.ticket),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Ticket Number',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'TIC181',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Seat & Bag & meal
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 13.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 16.0,
                                left: 16.0,
                                right: 16.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(Icons.chair_outlined),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Seat',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'C6',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(Icons.luggage_outlined),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Baggage',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          '20Kg',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(Icons.no_meals),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Meal',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Not Included',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Barcode
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13.0),
                          child: BarcodeWidget(
                            data: 'T I C 1 8 1 S A 1 5 7 2 1 1 2 2 2',
                            style: const TextStyle(letterSpacing: 4.2772214),
                            width: 340,
                            height: 100,
                            barcode: Barcode.code93(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Download_Button
                Padding(
                  padding:
                      const EdgeInsets.only(top: 34.0, left: 4.0, right: 4.0),
                  child: SizedBox(
                    width: 410,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Screen4(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 135,
                          right: 135,
                          top: 7,
                          bottom: 5,
                        ),
                        child: Text(
                          'Download',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
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
}
