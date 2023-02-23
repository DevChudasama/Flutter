import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _imageController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _imageController.text = documentSnapshot['image'];
      _firstnameController.text = documentSnapshot['first name'];
      _lastnameController.text = documentSnapshot['last name'];
      _ageController.text = documentSnapshot['age'].toString();
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'Image Url'),
              ),
              TextField(
                controller: _firstnameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastnameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Add User'),
                  onPressed: () async {
                    final String image = _imageController.text;
                    final String firstname = _firstnameController.text;
                    final String lastname = _lastnameController.text;
                    final int age = int.parse(_ageController.text);

                    if (age != null) {
                      await _users.add({
                        "image": image,
                        "first name": firstname,
                        "last name": lastname,
                        "age": age
                      });
                      _imageController.text = '';
                      _firstnameController.text = '';
                      _lastnameController.text = '';
                      _ageController.text = '';
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _imageController.text = documentSnapshot['image'];
      _firstnameController.text = documentSnapshot['first name'];
      _lastnameController.text = documentSnapshot['last name'];
      _ageController.text = documentSnapshot['age'].toString();
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'Url'),
              ),
              TextField(
                controller: _firstnameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastnameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String image = _imageController.text;
                    final String firstname = _firstnameController.text;
                    final String lastname = _lastnameController.text;
                    final int age = int.parse(_ageController.text);

                    await _users.doc(documentSnapshot!.id).update({
                      "image": image,
                      "first name": firstname,
                      "last name": lastname,
                      "age": age
                    });
                    _imageController.text = '';
                    _firstnameController.text = '';
                    _lastnameController.text = '';
                    _ageController.text = '';
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _delete(String userId) async {
    await _users.doc(userId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User deleted successfully'),
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('Users');
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
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) => showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                title: const Text('Delete User?'),
                                content: const Text(
                                  'This user wiil be permanently deleted from this list',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        _delete(documentSnapshot.id).then((value) => Navigator.of(context).pop()),
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    documentSnapshot['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'First Name: ${documentSnapshot['first name']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Last Name: ${documentSnapshot['last name']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Age: ${documentSnapshot['age'].toString()}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () => _update(documentSnapshot),
                            icon: const Icon(
                              CupertinoIcons.pen,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _create();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const AddUser(),
          //   ),
          // );
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
