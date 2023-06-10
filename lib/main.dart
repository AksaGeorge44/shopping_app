import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app1/constants/theme.dart';
import 'package:shopping_app1/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:shopping_app1/firebase_helper/firebase_options/firebase_options.dart';
import 'package:shopping_app1/provider/provider.dart';
import 'package:shopping_app1/screens/auth_ui/welcome/welcome.dart';
import 'package:shopping_app1/screens/custombtmbar/custombtmbar.dart';
import 'package:shopping_app1/screens/home/home.dart';

Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(
  //  options: DefaultFirebaseConfig.platformOptions,

  //);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShoppingApp',
        theme: themeData,
        home: CustomBottomBar(),


      ),
    );
  }
}



