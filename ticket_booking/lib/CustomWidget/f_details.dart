import 'package:flutter/material.dart';

import '../screen3.dart';

class FlightDetails extends StatelessWidget {
  FlightDetails({
    super.key,
    required this.image,
    required this.airlinename,
    required this.DPOtime,
    required this.duratoin,
    required this.DPStime,
    required this.price,
    required this.s_price,
    required this.isActive,
  });
  String image;
  String airlinename;
  String DPOtime;
  String duratoin;
  String DPStime;
  String price;
  String s_price;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 4.0,
        right: 5.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/airline_logo/$image',
                  width: 25,
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 280),
                  child: Text(
                    airlinename,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Screen3(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      DPOtime,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'DPO',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 7.0),
                      child: Center(
                        child: Icon(
                          Icons.flight_takeoff_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          duratoin,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: SizedBox(
                            width: 57,
                            child: Divider(
                              height: 10,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Text(
                          'Direct',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Center(
                        child: Icon(Icons.flight_land, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      DPStime,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'DPS',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'IDR$price',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      // color: Colors.green,
                      child: Text(
                        'IDR$s_price',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.orange,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.luggage_outlined,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  // color: Colors.green,
                  child: const Text('IncludedPersonalItem'),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: isActive
                      ? const EdgeInsets.only(
                          left: 99,
                        )
                      : const EdgeInsets.only(
                          left: 89,
                        ),
                  color: isActive ? Colors.orange : Colors.green[100],
                  child: Padding(
                    padding: isActive
                        ? const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          )
                        : const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                    child: Text(
                      isActive ? 'Recommended' : 'Free Reschedule',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : Colors.green[800],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
