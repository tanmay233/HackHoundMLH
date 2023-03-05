import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


final _auth=FirebaseAuth.instance;

class _SignUpState extends State<SignUp> {
 final _emailController=TextEditingController();
 final _passwordController=TextEditingController();
 final _nameController=TextEditingController();

 @override
 void dispose(){
  _emailController.dispose();
  _nameController.dispose();
  _passwordController.dispose();

  super.dispose();

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 25, 3, 104),
      body: Column(children: [
        Container(child: Image.asset('asset/signup.jpg')),
        Container(width: double.infinity,margin: EdgeInsets.symmetric(horizontal: 25),
            // height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(30),)
      ],)
    );
  }
}