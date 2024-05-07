import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_anonymus/global/thoast.dart';
import 'package:login_anonymus/user-auth/presentation/page/loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Welcome to homepage"),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              nottifMelayang(message: "Log Out suksess");
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
            }, child: const Text("LogOut"))
          ],
        ),
      ),
    );
  }
}