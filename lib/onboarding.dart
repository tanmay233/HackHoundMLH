import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing_add_subtract_of_items/login/login.dart';

class onboard extends StatelessWidget {
  const onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:InkWell(
          onTap: (){
            // Navigator.push(context,MaterialPageRoute(builder: (context)=> const PieChartMaker()));
            
            Navigator.push(context,MaterialPageRoute(builder: (context)=> const Login()));
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("asset/onboard.jpg",fit: BoxFit.cover,)
      ),
        ),
    );
  }
}