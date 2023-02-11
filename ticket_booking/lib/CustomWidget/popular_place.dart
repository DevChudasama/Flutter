import 'package:flutter/material.dart';
import 'package:ticket_booking/CustomWidget/destination.dart';

class Popular_place extends StatelessWidget {
  Popular_place({super.key, required this.isActive});
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isActive ? 25 : 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular places near you',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: SizedBox(
              height: 200,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Destination(
                        image: 'p1.jpg',
                        location: 'Pantai Batu Karas',
                        distance: '1h 20m',
                        destination: ' drive from you',
                        isActive: false,
                      ),
                      Destination(
                        image: 'p2.jpg',
                        location: 'Goa Sunyaragi',
                        distance: '1h 30m',
                        destination: ' drive from you',
                        isActive: false,
                      ),
                      Destination(
                        image: 'p3.jpg',
                        location: 'Sian Jin Ku Poh Shrine',
                        distance: '1h 10m',
                        destination: ' drive from you',
                        isActive: false,
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
