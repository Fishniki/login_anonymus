import 'package:flutter/material.dart';
import 'package:login_anonymus/global/thoast.dart';
import 'package:login_anonymus/user-auth/presentation/page/Crud/created.dart';
import 'package:login_anonymus/user-auth/presentation/page/homepage.dart';
import 'package:login_anonymus/user-auth/presentation/widget/formcontainer.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tambah data"),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(
              height: 30,
            ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors.blue,
                        backgroundColor: Colors.red[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: const Text(
                      "Batal",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      createdData(UserModel(
                        username: usernameController.text,
                        country: countryController.text,
                        age: int.parse(ageController.text),
                      ));
                      usernameController.clear();
                      countryController.clear();
                      ageController.clear();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomePage()), (route) => false);
                      nottifMelayang(message: "Upload data suksess");
                    },
                    style: ElevatedButton.styleFrom(
                        // foregroundColor: Colors.blue,
                        backgroundColor: const Color.fromRGBO(100, 181, 246, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}
