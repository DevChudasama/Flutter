import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_backend/pages/add_user_page.dart';
import 'package:login_backend/pages/update_page.dart';
import 'package:login_backend/read/get_user_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  void signUserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Text(
              'logged in as :${user.email!}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(width: 14),
          IconButton(
            onPressed: signUserout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: FutureBuilder(
        future: getDocId(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: docIDs.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'images/camera5.jpg',
                              height: 100,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GetDetails(
                            documentId: docIDs[index],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UpdateUser(
                                docIDs[index],
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          CupertinoIcons.pen,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      // ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (context, index) {
      //     return Column(
      //       children: const [
      //         UserCard(),
      //         UserCard(),
      //         UserCard(),
      //       ],
      //     );
      //   },
      // ),

      //add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddUser(),
            ),
          );
        },
        backgroundColor: Colors.deepPurple[600],
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
