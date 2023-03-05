import 'package:flutter/material.dart';
import 'package:testing_add_subtract_of_items/login/login.dart';
import 'package:testing_add_subtract_of_items/login/signup.dart';
import 'package:testing_add_subtract_of_items/onboarding.dart';
import 'package:testing_add_subtract_of_items/productlist.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onboard(),
      // routes: {
      //   productlist.routeName: (context)=> const productlist(),
      //   Login.routeName:(context) => const Login()
      // },
    );
      },),
    );
  }
}
