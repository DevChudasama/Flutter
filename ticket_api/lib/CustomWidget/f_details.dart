import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../add_user_page.dart';
import '../screen3.dart';

class FlightDetails extends StatefulWidget {
  FlightDetails({
    super.key,
  });

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: jsonDecode(snapshot.data!.body.toString()).length,
            itemBuilder: (context, index) {
              bool isActive = true;
              // (jsonDecode(snapshot.data!.body.toString())[index]
              //         ['Is']
              //     .toString()) as bool;
              DateTime time = DateTime.now();
              // DateTime dpstime =
              //     jsonDecode(snapshot.data!.body.toString())[index]['DpsTime']
              //         .toString() as DateTime;
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async => await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Flight Details?'),
                            content: const Text(
                              'This flight details wiil be permanently deleted from this list',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () => deleteFlight((jsonDecode(
                                        snapshot.data!.body
                                            .toString())[index]['id']))
                                    .then((value) {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                }),
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      ),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: CupertinoIcons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 4.0,
                    right: 5.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  jsonDecode(snapshot.data!.body.toString())[
                                          index]['Logo']
                                      .toString(),
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  jsonDecode(snapshot.data!.body.toString())[
                                          index]['AirlineName']
                                      .toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
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
                                  DateFormat('HH:mm').format(time),
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
                                    Row(
                                      children: [
                                        Text(
                                          "${jsonDecode(snapshot.data!.body.toString())[index]['Duration_H'].toString()}h",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "${jsonDecode(snapshot.data!.body.toString())[index]['Duration_M'].toString()}m",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.0),
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
                                    child: Icon(Icons.flight_land,
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  DateFormat('HH:mm').format(time),
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
                                  'IDR${jsonDecode(snapshot.data!.body.toString())[index]['Price'].toString()}',
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
                                    'IDR${jsonDecode(snapshot.data!.body.toString())[index]['S_Price'].toString()}',
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
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(
                                      MaterialPageRoute(
                                        builder: (context) => AddUser(
                                            jsonDecode(
                                                snapshot.data!.body)[index]),
                                      ),
                                    )
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: const Icon(
                                    Icons.luggage_outlined,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text('IncludedPersonalItem'),
                                ),
                              ],
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // margin: isActive
                              //     ? const EdgeInsets.only(
                              //         left: 99,
                              //       )
                              //     : const EdgeInsets.only(
                              //         left: 89,
                              //       ),
                              color:
                                  isActive ? Colors.orange : Colors.green[100],
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
                                    color: isActive
                                        ? Colors.white
                                        : Colors.green[800],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: getData(),
    );
  }
}

Future<http.Response> getData() async {
  var response = await http.get(
      Uri.parse("https://63f8d83e1dc21d5465c8c351.mockapi.io/Flightdetails"));
  // print(response.body.toString());

  return response;
}

Future<void> deleteFlight(id) async {
  var response = await http.delete(Uri.parse(
      "https://63f8d83e1dc21d5465c8c351.mockapi.io/Flightdetails/$id"));
}
