import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart';
import 'package:testing_add_subtract_of_items/cart_provider.dart';
import 'package:testing_add_subtract_of_items/cartmodel.dart';
import 'package:testing_add_subtract_of_items/cartscree.dart';
import 'package:testing_add_subtract_of_items/customization.dart';
import 'package:testing_add_subtract_of_items/dbhelper.dart';
import 'package:testing_add_subtract_of_items/list.dart';
import 'package:provider/provider.dart';

class productlist extends StatefulWidget {
  // static const routeName='/productlist';
  const productlist({super.key});

  @override
  State<productlist> createState() => _productlistState();
}

class _productlistState extends State<productlist> {
  Color backcolor = Color.fromARGB(255, 25, 3, 104);
  DBhelper dBhelper = DBhelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Product list'),
    //     centerTitle: true,
    //     actions: [
    //       InkWell(
    //         onTap: (){
    //           Navigator.push(context, MaterialPageRoute(builder: (context)=>cartscreen()));
    //         },
    //         child: Icon(Icons.shopping_bag_outlined),
    //       ),
    //       SizedBox(
    //         width: 30.0,
    //       ),
    //       Center(
    //         child: Consumer<CartProvider>(
    //           builder: (context, value, child) {
    //             return Text(
    //               value.getcounter().toString(),
    //               style: TextStyle(color: Colors.black),
    //             );
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: ListView.builder(
    //             itemCount: productName.length,
    //             itemBuilder: (context, index) {
    //               return Card(
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       mainAxisSize: MainAxisSize.max,
    //                       children: [
    //                         Image(
    //                           height: 100,
    //                           width: 100,
    //                           image:
    //                               NetworkImage(productImage[index].toString()),
    //                         ),
    //                         SizedBox(
    //                           width: 5,
    //                         ),
    //                         Column(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(productName[index].toString()),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             Text(productUnit[index].toString() +
    //                                 "   " +
    //                                 productPrice[index].toString()),
    //                             InkWell(
    //                               onTap: () {
    //                                 dBhelper
    //                                     .insert(Cart(
    //                                         id: index,
    //                                         image:
    //                                             productImage[index].toString(),
    //                                         // initialprice: productPrice[index],
    //                                         // productid: index.toString(),
    //                                         productname:
    //                                             productName[index].toString(),
    //                                         productprice: productPrice[index],
    //                                         quantity: 1,
    //                                         // unittag:i
    //                                             // productUnit[index].toString()
    //                                             ))
    //                                     .then((value) {
    //                                   print("product is added");
    //                                   cart.addtotalprice(double.parse(
    //                                       productPrice[index].toString()));
    //                                   cart.addcounter();
    //                                 }).onError((error, stackTrace) {
    //                                   print(error.toString());
    //                                 });
    //                               },
    //                               child: Container(
    //                                 height: 35,
    //                                 width: 100,
    //                                 decoration:
    //                                     BoxDecoration(color: Colors.green),
    //                                 child: Center(child: Text("ADD TO CART")),
    //                               ),
    //                             )
    //                           ],
    //                         )
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               );
    //             }),
    //       ),

    //     ],
    //   ),
    // );

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(26),
                    bottomRight: Radius.circular(26)),
                color: backcolor),
            child: Container(
              padding: EdgeInsets.only(top: 70),
              margin: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>cartscreen()));
                          },
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, value, child) {
                            return Text(
                              value.getcounter().toString(),
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
        Expanded(
          child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: backcolor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>custom()));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                image[index][0].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              name[index][0].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: (){
                                
                                    dBhelper
                                        .insert(Cart(
                                            id: index,
                                            image:
                                                image[index][0].toString(),
                                            // initialprice: productPrice[index],
                                            // productid: index.toString(),
                                            productname:
                                                name[index][0].toString(),
                                            productprice: price[index][0],
                                            quantity: 1,
                                            // unittag:i
                                                // productUnit[index].toString()
                                                ))
                                        .then((value) {
                                      print("product is added");
                                      cart.addtotalprice(double.parse(
                                          price[index][0].toString()));
                                      cart.addcounter();
                                    }).onError((error, stackTrace) {
                                      print(error.toString());
                                    });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: backcolor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>custom()));
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                image[index][1].toString(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              name[index][1].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: (){
                                dBhelper
                                        .insert(Cart(
                                            id: index,
                                            image:
                                                image[index][1].toString(),
                                            // initialprice: productPrice[index],
                                            // productid: index.toString(),
                                            productname:
                                                name[index][1].toString(),
                                            productprice: price[index][1],
                                            quantity: 1,
                                            // unittag:i
                                                // productUnit[index].toString()
                                                ))
                                        .then((value) {
                                      print("product is added");
                                      cart.addtotalprice(double.parse(
                                          price[index][1].toString()));
                                      cart.addcounter();
                                    }).onError((error, stackTrace) {
                                      print(error.toString());
                                    });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        ],
      ),
    );
  }
}
