import 'package:flutter/material.dart';
import 'package:ticket_booking/CustomWidget/destination.dart';

class R_Destination extends StatelessWidget {
  R_Destination({super.key, required this.isActive});
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.only(top: isActive ? 25 : 17),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recommendation Destination',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Destination(
                        image: 'd1.jpg',
                        location: 'Bali',
                        destination: 'Indonesia',
                        isActive: true,
                      ),
                      Destination(
                        image: 'd2.jpg',
                        location: 'Paris',
                        destination: 'France',
                        isActive: true,
                      ),
                      Destination(
                        image: 'd3.jpg',
                        location: 'Bora Bora',
                        destination: 'French Polynesia',
                        isActive: true,
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
