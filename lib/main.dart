import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wedding_back_office/login/page/page_login.dart';
import 'package:wedding_back_office/panel/page/page_pannel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyAaTc3eQPeli10s3K44gS7xysH1f6UDlkI",
      appId: "1:558180308375:web:a33ab1a1d98814d73da0d2",
      messagingSenderId: "558180308375",
      projectId: "kiukiu-51c46",
      storageBucket: "kiukiu-51c46.appspot.com",
      authDomain: "kiukiu-51c46.firebaseapp.com", measurementId: "G-PZXPVQ4NVQ"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType){
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
    },);
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const PanelPage();
  }
}
