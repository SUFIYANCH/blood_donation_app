import 'package:blood_donation_app/models/donor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final fireStore =
      FirebaseFirestore.instance.collection("donors").withConverter(
            fromFirestore: DonorModel.fromFirestore,
            toFirestore: (value, options) => value.toFirestore(),
          );

  Stream<QuerySnapshot<DonorModel>> getDonor() {
    return fireStore.snapshots();
  }

  //add
  Future<DocumentReference<DonorModel>> addDonor(
      String name, String phone, String bloodgrp) async {
    return await fireStore
        .add(DonorModel(name: name, phone: phone, bloodgrp: bloodgrp));
  }

  Future<void> updateDonor(
      String name, String phone, String bloodgrp, String id) async {
    return await fireStore.doc(id).update(
        DonorModel(name: name, phone: phone, bloodgrp: bloodgrp).toFirestore());
  }

  Future<void> deleteDonor(String id) async {
    return await fireStore.doc(id).delete();
  }
}
