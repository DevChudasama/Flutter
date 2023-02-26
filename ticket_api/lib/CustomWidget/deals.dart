import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Deals extends StatelessWidget {
  Deals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: jsonDecode(snapshot.data!.body.toString()).length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
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
                              child: Image.network(
                                jsonDecode(snapshot.data!.body.toString())[
                                        index]['D_Image']
                                    .toString(),
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
                                children: [
                                  Text(
                                    jsonDecode(snapshot.data!.body.toString())[
                                            index]['Text1']
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    jsonDecode(snapshot.data!.body.toString())[
                                            index]['Text2']
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Special discount up to ${jsonDecode(snapshot.data!.body.toString())[index]['Dis'].toString()}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Future<http.Response> getData() async {
  var response = await http
      .get(Uri.parse("https://63f8d83e1dc21d5465c8c351.mockapi.io/3IN1"));
  // print(response.body.toString());

  return response;
}
