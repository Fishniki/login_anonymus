import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_anonymus/global/thoast.dart';
import 'package:login_anonymus/user-auth/presentation/page/created_data.dart';
import 'package:login_anonymus/user-auth/presentation/page/loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const CreateData()), (route) => false);
        }, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Welcome to homepage"),
            // ElevatedButton(
            //     onPressed: () {
            //       // createdData(UserModel(
            //       //   username: "Niki",
            //       //   country: "Indonesia",
            //       //   age: 17,
            //       // ));
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateData()));
            //     },
            //     child: const Text("Created Data")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  nottifMelayang(message: "Log Out suksess");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false);
                },
                child: const Text("LogOut"))
          ],
        ),
      ),
    );
  }
}

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
