import 'package:blood_donation_app/colors/colors.dart';
import 'package:blood_donation_app/screens/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference donors =
      FirebaseFirestore.instance.collection('donors');

  void deleteDonor(docId) {
    donors.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      appBar: AppBar(
        title: const Text('Blood Donation App'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: donors.orderBy('name').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];

                  return Container(
                    margin: const EdgeInsets.only(
                        right: 10, left: 10, bottom: 10, top: 20),
                    padding: const EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 241, 239, 239),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 30,
                            child: Text(
                              donorSnap['group'].toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              donorSnap['name'],
                              style: const TextStyle(
                                  color: secondaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              donorSnap['phone'].toString(),
                              style: const TextStyle(
                                  color: secondaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/update',
                                    arguments: {
                                      'name': donorSnap['name'],
                                      'phone': donorSnap['phone'].toString(),
                                      'group': donorSnap['group'],
                                      'id': donorSnap.id
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              color: secondaryColor,
                              iconSize: 24,
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                          title: const Text("Are you sure ?"),
                                          content: const Text(
                                              "This donor's details will delete permenantly"),
                                          actions: [
                                            TextButton(
                                                onPressed: (() {
                                                  Navigator.of(context).pop();
                                                }),
                                                child: const Text("Cancel")),
                                            TextButton(
                                                onPressed: (() {
                                                  deleteDonor(donorSnap.id);

                                                  Navigator.of(context).pop();
                                                }),
                                                child: const Text("Delete"))
                                          ],
                                        )));
                              },
                              icon: const Icon(Icons.delete),
                              color: primaryColor,
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
