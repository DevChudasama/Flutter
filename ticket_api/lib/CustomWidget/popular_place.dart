import 'package:flutter/material.dart';
import 'package:ticket_api/CustomWidget/destination.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
              child: FutureBuilder<http.Response>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Destination(
                              image: jsonDecode(snapshot.data!.body.toString())[
                                      index]['P_Image']
                                  .toString(),
                              location: jsonDecode(
                                          snapshot.data!.body.toString())[index]
                                      ['P_Name']
                                  .toString(),
                              distance_h:
                                  '${jsonDecode(snapshot.data!.body.toString())[index]['Dis'].toString()}h',
                              distance_m:
                                  '${jsonDecode(snapshot.data!.body.toString())[index]['Dis_m'].toString()}m',
                              destination: ' drive from you',
                              isActive: false,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<http.Response> getData() async {
  var response = await http
      .get(Uri.parse("https://63f8d83e1dc21d5465c8c351.mockapi.io/3IN1"));
  // print(response.body.toString());

  return response;
}
