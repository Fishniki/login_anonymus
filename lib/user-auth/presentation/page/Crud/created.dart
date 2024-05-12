import 'package:cloud_firestore/cloud_firestore.dart';

void createdData(UserModel userModel){
  final userCollection = FirebaseFirestore.instance.collection("users");

  String id = userCollection.doc().id;

  final newUser = UserModel(
    username: userModel.username,
    age: userModel.age,
    country: userModel.country,
    id: id
  ).toJson();

  userCollection.doc(id).set(newUser);
}

class UserModel{
  final String? username;
  final String? country;
  final int? age;
  final String? id;

  UserModel({this.username, this.country, this.age, this.id});

  static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)  {
    return UserModel(
      username: snapshot["username"],
      country: snapshot["country"],
      age: snapshot["age"],
      id: snapshot["id"]
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "username" : username,
      "country" : country,
      "age" : age,
      "id" : id
    };
  }

}
