import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_anonymus/user-auth/presentation/page/Crud/created.dart';

void updateData(UserModel userModel) {
  final userCollection = FirebaseFirestore.instance.collection("users");

  final newData = UserModel(
    username: userModel.username,
    id: userModel.id,
    country: userModel.country,
    age: userModel.age
  ).toJson();

  userCollection.doc(userModel.id).update(newData);
}