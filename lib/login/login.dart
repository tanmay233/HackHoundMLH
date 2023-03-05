import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_add_subtract_of_items/homepage/home.dart';

class Login extends StatefulWidget {
  // static const routeName='/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final _auth= FirebaseAuth.instance;
class _LoginState extends State<Login> {
final _emailController=TextEditingController();
final _passwordController=TextEditingController();

@override
void dispose(){
  _emailController.dispose();
  _passwordController.dispose();

  super.dispose();
}
Future<void> signIn({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 25, 3, 104),
      body: Column(
        children: [
          Container(child: Image.asset('asset/login.jpg')),
          Container(
            // width: MediaQuery.of(context).size.width*0.9,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 25),
            // height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(30),
            child: Column(children: [
              Container(
                width: double.infinity,
                child: Text('LOGIN',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(219, 223, 90, 13),
                    ),
                    // TextStyle(
                    //   fontFamily: 'Poppins',
                    //   fontSize: 25,
                    //   fontWeight: FontWeight.bold,
                    //   color: Color.fromARGB(219, 223, 90, 13),
                    // )
                    //color: Color.fromARGB(219, 223, 90, 13),
                    ),
              ),
              // Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              ElevatedButton(
                onPressed: (() {
                  signIn(email: _emailController.text, password: _passwordController.text);
                  print('Signed in');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> homep()));
                }),
                child: Text('SIGN IN'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(219, 223, 90, 13),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Don\'t Have an Account?',
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color.fromARGB(219, 223, 90, 13),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}