// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_anonymus/global/thoast.dart';
import 'package:login_anonymus/user-auth/presentation/page/Crud/created.dart';
import 'package:login_anonymus/user-auth/presentation/page/Crud/update.dart';
import 'package:login_anonymus/user-auth/presentation/page/created_data.dart';
import 'package:login_anonymus/user-auth/presentation/page/loginpage.dart';
import 'package:login_anonymus/user-auth/presentation/widget/formcontainer.dart';
import 'package:login_anonymus/user-auth/presentation/widget/textcustom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Future EditData(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.cancel))
                      ],
                    ),
                    const Text(
                      "Masukan Nama Anda",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormContainer(
                      controller: usernameController,
                      hintext: "Username",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Masukan Negara Anda",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormContainer(
                      controller: countryController,
                      hintext: "Country",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Berapa Umur Anda",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.35),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black45),
                          hintText: "Age",
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      updateData(UserModel(
                        username: usernameController.text,
                        age: int.parse(ageController.text),
                        country: countryController.text,
                        id: id
                      ));
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePage()), (route) => false);
                    }, child: const Text("Update"))
                  ],
                ),
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateData()),
                    (route) => false);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome to homepage"),
          // StreamBuilder<List<UserModel>>(
          //   stream: readData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (snapshot.data!.isEmpty) {
          //       return const Center(
          //         child: Text("Data Kosong"),
          //       );
          //     }

          //     final users = snapshot.data;
          //     return Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 10,
          //       ),
          //       child: Column(
          //           children: users!.map((user) {
          //         return Container(
          //             width: double.infinity,
          //             height: 50,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.grey[300],
          //             ),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 15,
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           CustonmText(user.username!),
          //                           const SizedBox(
          //                             width: 5,
          //                           ),
          //                           CustonmText(user.age!.toString())
          //                         ],
          //                       ),
          //                       CustonmText(user.country!)
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       IconButton(
          //                           onPressed: () {},
          //                           icon: const Icon(Icons.edit)),
          //                       IconButton(
          //                           onPressed: () {},
          //                           icon: const Icon(Icons.delete))
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ));
          //       }).toList()),
          //     );
          //   },
          // ),

          FutureBuilder<List<UserModel>>(
              future: readData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue[300],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Terdapat Error"),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("Data Kosong"),
                  );
                }

                final users = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: users!.length,
                      itemBuilder: (context, index) {
                        final usersf = users[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[300],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustonmText(usersf.username!),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          CustonmText(usersf.age.toString())
                                        ],
                                      ),
                                      CustonmText(usersf.country!)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            usernameController.text = usersf.username.toString();
                                            countryController.text = usersf.country.toString();
                                            ageController.text = usersf.age.toString();
                                            EditData(usersf.id.toString());
                                          },
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                nottifMelayang(message: "Log Out suksess");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
              child: const Text("LogOut"))
        ],
      ),
    );
  }
}

// Stream<List<UserModel>> readData() {
//   final userCollection = FirebaseFirestore.instance.collection("users");

//   return userCollection.snapshots().map((qureySnapshot) =>
//       qureySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
// }

Future<List<UserModel>> readData() async {
  final userDataCollection = FirebaseFirestore.instance.collection("users");

  final snapshot = await userDataCollection.get();
  return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
}

Future UpdateDataNew(String id, Map<String, dynamic> updateInfo)async{
  return await FirebaseFirestore.instance.collection("users").doc(id).update(updateInfo);
}