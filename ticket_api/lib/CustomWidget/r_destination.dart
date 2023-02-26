import 'package:flutter/material.dart';
import 'package:ticket_api/CustomWidget/destination.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class R_Destination extends StatelessWidget {
  R_Destination({super.key, required this.isActive});
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Container(
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
                child: FutureBuilder<http.Response>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            jsonDecode(snapshot.data!.body.toString()).length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Destination(
                                image:
                                    jsonDecode(snapshot.data!.body.toString())[
                                            index]['R_Image']
                                        .toString(),
                                location:
                                    jsonDecode(snapshot.data!.body.toString())[
                                            index]['Location']
                                        .toString(),
                                destination:
                                    jsonDecode(snapshot.data!.body.toString())[
                                            index]['country']
                                        .toString(),
                                isActive: true,
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
                  future: getData(),
                ),
              ),
            ),
          ],
        ),
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
