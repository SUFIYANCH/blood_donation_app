// import 'package:cloud_firestore/cloud_firestore.dart';

// class BloodService {
//   // CollectionReference for Donors

//   final CollectionReference _collectionReference =
//       FirebaseFirestore.instance.collection("donors");

//   // Read all Donors as Stream

//   Stream<QuerySnapshot> bloodStream() {
//     return _collectionReference.snapshots();
//   }

//   // add Donor

//   Future<DocumentReference<Object?>> addDonor(
//       String name, int mobileNumber, String bloodgrp) {
//     return _collectionReference.add(
//         {"name": name, "MobileNumber": mobileNumber, "bloodgrp": bloodgrp});
//   }

//   // update Donor by id

//   Future<void> updateDonor(
//       String id, String name, int mobileNumber, String bloodgrp) {
//     return _collectionReference.doc(id).update(
//         {"name": name, "MobileNumber": mobileNumber, "bloodgrp": bloodgrp});
//   }

//   // delete Donor by id

//   Future<void> deleteDonor(String id) {
//     return _collectionReference.doc(id).delete();
//   }
// }
