import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testing_add_subtract_of_items/disc.dart';
import 'package:testing_add_subtract_of_items/marspie.dart';
import 'package:testing_add_subtract_of_items/productlist.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PieChartMaker()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage("asset/earth2.png",), fit: BoxFit.cover),
              ),
              child: Center(
                  child: Text(
                "EARTHLY",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PieChartMaker2()));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => productlist()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage("asset/mars.png"), fit: BoxFit.cover),
              ),
              child: Center(
                  child: Text(
                "MARS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
            ),
          ),
        ],
      )
    ;
  }
}