import 'package:cloud_firestore/cloud_firestore.dart';

void deleteData(String id) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  userCollection.doc(id).delete();
}