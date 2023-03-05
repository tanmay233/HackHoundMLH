import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_add_subtract_of_items/homepage/seats.dart';

import 'menu.dart';

class homep extends StatefulWidget {
  const homep({super.key});

  @override
  State<homep> createState() => _homepState();
}

class _homepState extends State<homep> {
  Color backcolor = Color.fromARGB(255, 25, 3, 104);
  String? choice; //no radio button will be selected
  int pick = 0;
  var qrdata = 'QR Code Result';

  final snackBar = const SnackBar(
    content: Text('The seat is occupied'),
  );
  final snackBar1 = const SnackBar(
    content: Text('Your seat is booked'),
  );
  final snackBar2 = const SnackBar(
    content: Text('Invalid QR'),
  );

  void scanqrcode() async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;
      setState(() {
        qrdata = result;
      });
      // for (int i = 0; i < occupied.length; i++) {
      //   if (int.parse(qrdata) == occupied[i]) {
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   } else if (int.parse(qrdata) == vacant[i]) {
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar1);
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar2);
      //   }
      // }
      if(int.parse(qrdata) == occupied[0] || int.parse(qrdata) == occupied[1] || int.parse(qrdata) == occupied[2] || int.parse(qrdata) == occupied[3] || int.parse(qrdata) == occupied[4]){
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (int.parse(qrdata) == vacant[0] ||int.parse(qrdata) == vacant[1] || int.parse(qrdata) == vacant[2] || int.parse(qrdata) == vacant[3]){
        ScaffoldMessenger.of(context).showSnackBar(snackBar1);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar2);
      }
      print('QR Code result :- ');
      print(result);
    } on PlatformException {
      qrdata = 'Failed To Scan QR Code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.menu),
        ),
        backgroundColor: backcolor,
        title: Text("Welcome back!", style: GoogleFonts.poppins(),),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.notifications_none),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            width: MediaQuery.of(context).size.width,
            height: 205,
            decoration: BoxDecoration(
                color: backcolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(26),
                    bottomRight: Radius.circular(26))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(300.0),
                  child: Image.asset("asset/profile.jpg", height: 150,)
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "CODEX",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    pick = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xffdb5c2c)
                  ),
                  child: Text("Menu", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 17, color: Colors.white)),),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    scanqrcode();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xffdb5c2c)
                  ),
                  child: Text("Book Seat", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 17, color: Colors.white)),),
                ),
              ),
              
            ],
          ),
          SizedBox(height: 25,),
          menu()
          ],
        ),
      ),
    );
  }
}