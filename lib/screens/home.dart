import 'package:blood_donation_app/colors/colors.dart';
import 'package:blood_donation_app/providers/provider.dart';
import 'package:blood_donation_app/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          ref.read(isEditProvider.notifier).state = false;
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Blood Donation App'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: Service().getDonor(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var donors = snapshot.data!.docs;
              return ListView.builder(
                itemCount: donors.length,
                itemBuilder: (context, index) {
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
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 30,
                          child: Text(
                            donors[index].data().bloodgrp,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              donors[index].data().name,
                              style: const TextStyle(
                                  color: secondaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              donors[index].data().phone,
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
                                ref.read(idProvider.notifier).state =
                                    donors[index].id;
                                ref.read(isEditProvider.notifier).state = true;
                                Navigator.pushNamed(context, '/add');
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
                                                  Service().deleteDonor(
                                                      donors[index].id);
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
            } else {
              return const Center(
                child: Text('No Donor Registered'),
              );
            }
          },
        ),
      ),
    );
  }
}
