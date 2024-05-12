import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_anonymus/user-auth/presentation/page/Crud/created.dart';

void updateData(String userId,UserModel userModel) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  final newData = UserModel(
    username: userModel.username,
    country: userModel.country,
    age: userModel.age
  ).toJson();

  userCollection.doc(userId).update(newData);
}