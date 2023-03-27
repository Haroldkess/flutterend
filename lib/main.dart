import 'package:flutter/material.dart';
import 'package:flutterend/presentation/constant.dart';
import 'package:flutterend/presentation/landingpage/stayhome.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterend/presentation/responsive/ui_manager.dart';
import 'package:provider/provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb
          ? const FirebaseOptions(
            
               apiKey: "AIzaSyDsE_QiDT0Ice_rPvRuuNj2kfR931Xg3y8",
              // authDomain: "econ-d3763.firebaseapp.com",
              // databaseURL: "https://econ-d3763.firebaseio.com",
               projectId: "econ-d3763",
               storageBucket: "econ-d3763.appspot.com",
               messagingSenderId: "256946432063",
               appId: "1:256946432063:web:1856f0e5b89d2672b4708a",
             //  measurementId: "G-N3TK2SKZMQ"
            )
          : null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
          ChangeNotifierProvider(
          create: (context) => UiProvider(),
        ),

    
    ], 
    child: MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StayHome(),
    ),
    );
  }
}
