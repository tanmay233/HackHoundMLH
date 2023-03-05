import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class custom extends StatefulWidget {
  const custom({super.key});

  @override
  State<custom> createState() => _customState();
}

class _customState extends State<custom> {
  int val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 20),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
                color: Color.fromARGB(255, 25, 3, 104)),
            child: Text(
              "Aliency Soup",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage(
                    "asset/custom.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Center(
                child: Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            )),
          ),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Customize Your Meals",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            decoration: BoxDecoration(color: Colors.orange),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      val--;
                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Text(
                  val.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      val++;
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.orange),
                child: Text(
                  "\$23",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.orange),
                child: InkWell(
                  onTap: (){
                  },
                    child: Text(
                  "Order Now",
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
