import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_anonymus/features/app/splash-screen/splash-screen.dart';
import 'package:login_anonymus/firebase/firebase_options.dart';
import 'package:login_anonymus/user-auth/presentation/page/homepage.dart';
import 'package:login_anonymus/user-auth/presentation/page/loginpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter FireBase"),
        ),
        body: const SplashScreen(
          child: LoginPage(),
        ),
      ),
    );
  }
}