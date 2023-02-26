import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination extends StatelessWidget {
  String image;
  String location;
  String destination;
  bool isActive;
  String? distance_h;
  String? distance_m;

  Destination({
    super.key,
    required this.image,
    required this.location,
    this.distance_h,
    this.distance_m,
    required this.destination,
    required this.isActive,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // flex: 5,
      height: 208,
      width: 190, //220
      child: Stack(
        children: [
          SizedBox(
            height: 204,
            width: 190, //220
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // color: Colors.orange,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: isActive ? 136 : 147,
            left: isActive ? 14 : 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: isActive ? 8 : 1),
                  child: Text(
                    location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isActive ? 23 : 16,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  children: [
                    if (isActive) ...[
                      const Icon(
                        CupertinoIcons.location_fill,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 2),
                    ] else
                      ...[],
                    if (isActive) ...[
                      Text(
                        destination,
                        style: TextStyle(
                          fontSize: isActive ? 18 : 14,
                          color: Colors.white,
                          fontWeight:
                              isActive ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                distance_h!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                distance_m!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            destination,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (isActive) ...[
            Positioned(
              top: 15,
              right: 0,
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
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0),
                    child: Text(
                      'Best Deal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ] else
            ...[],
        ],
      ),
    );
  }
}
