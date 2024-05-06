import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_anonymus/user-auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:login_anonymus/user-auth/presentation/page/homepage.dart';
import 'package:login_anonymus/user-auth/presentation/page/singUp.dart';
import 'package:login_anonymus/user-auth/presentation/widget/formcontainer.dart';
import 'package:login_anonymus/user-auth/presentation/widget/textcustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSignIn = false;

  final FirebasAuthServices _auth =FirebasAuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

   @override
  void dispose() {
     _emailController.dispose();
     _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              FormContainer(
                controller: _emailController,
                hintext: "Email",
                isPasswordField: false,
              ),
              const SizedBox(height: 10,),
              FormContainer(
                controller: _passwordController,
                hintext: "Password",
                isPasswordField: true,
              ),

              const SizedBox(height: 30,),

              GestureDetector(
                onTap: _signIn,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: _isSignIn ? const CircularProgressIndicator() : const CustonmText("Login"))
                ),
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun?"),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUP()));
                    },
                    child: const Text("Daftar", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
   void _signIn() async {

    setState(() {
      _isSignIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSignIn = false;
    });

    if (user != null) {
      print("User dikenali");
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
    }else{
      print("Password atau email error");
    }
  }
}