// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_anonymus/user-auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:login_anonymus/user-auth/presentation/page/loginpage.dart';
import 'package:login_anonymus/user-auth/presentation/widget/formcontainer.dart';
import 'package:login_anonymus/user-auth/presentation/widget/textcustom.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {

  bool isSignUp = false;

  final FirebasAuthServices _auth =FirebasAuthServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
     _usernameController.dispose();
     _emailController.dispose();
     _passwordController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
              const Text(
                "Sign UP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 30,
              ),

               FormContainer(
                controller: _usernameController,
                hintext: "Username",
                isPasswordField: false,
              ),

              const SizedBox(
                height: 10,
              ),

              FormContainer(
                controller: _emailController,
                hintext: "Email",
                isPasswordField: false,
              ),

              const SizedBox(
                height: 10,
              ),

              FormContainer(
                controller: _passwordController,
                hintext: "Password",
                isPasswordField: true,
              ),

              const SizedBox(
                height: 30,
              ),
              
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: isSignUp ? const CircularProgressIndicator() : const CustonmText("Sign Up"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // ignore: unused_element
  void _signUp() async {

    setState(() {
      isSignUp = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSignUp = false;
    });

    if (user != null) {
      print("User berhasil dibuat");
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
    }else{
      print("Terjadi kesalahan");
    }
  }
}
