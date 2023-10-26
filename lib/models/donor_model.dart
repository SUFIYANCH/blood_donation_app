import 'package:cloud_firestore/cloud_firestore.dart';

class DonorModel {
  String name;
  String phone;
  String bloodgrp;
  DonorModel({required this.name, required this.phone, required this.bloodgrp});

  factory DonorModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return DonorModel(
        name: data?['name'],
        phone: data?['phone'],
        bloodgrp: data?['bloodgrp']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "phone": phone,
      "bloodgrp": bloodgrp,
    };
  }
}
