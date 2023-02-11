import 'package:flutter/material.dart';

class Deals extends StatelessWidget {
  Deals({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 395,
      child: Stack(
        children: [
          SizedBox(
            height: 120,
            width: 395,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // color: Colors.orange,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/deals/$image',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 23,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Christmas Holiday',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Start Now!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Special discount up to 35%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    bottom: 62,
                  ),
                  child: SizedBox(
                    height: 29,
                    child: Card(
                      color: Colors.orange[900],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            6,
                          ),
                          bottomLeft: Radius.circular(
                            6,
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 1.5,
                        ),
                        child: Text(
                          'Ends in 7 days',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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
