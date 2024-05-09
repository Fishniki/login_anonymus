import 'package:flutter/material.dart';
import 'package:login_anonymus/user-auth/presentation/page/homepage.dart';
import 'package:login_anonymus/user-auth/presentation/widget/formcontainer.dart';

class CreateData extends StatelessWidget {
  const CreateData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tambah data"),
        backgroundColor: Colors.blue[800],
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
            const FormContainer(
              // controller: ,
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
            const FormContainer(
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
                    onPressed: () {},
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
