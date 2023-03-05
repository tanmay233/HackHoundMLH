import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:testing_add_subtract_of_items/cart_provider.dart';
import 'package:testing_add_subtract_of_items/cartmodel.dart';
import 'package:testing_add_subtract_of_items/list.dart';

import 'dbhelper.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  Color backcolor = Color.fromARGB(255, 25, 3, 104);
  DBhelper dBhelper = DBhelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('MY PRODUCTS'),
    //     centerTitle: true,
    //     actions: [
    //       Icon(Icons.shopping_bag_outlined),
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
    //       FutureBuilder(
    //         future: cart.getData(),
    //         // builder: (context, AsyncSnapshot<List<Cart>>)
    //         builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
    //           if (snapshot.hasData) {
    //             return Expanded(
    //               child: ListView.builder(
    //                   itemCount: snapshot.data!.length,
    //                   itemBuilder: (context, index) {
    //                     return Card(
    //                       child: Column(
    //                         children: [
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             mainAxisSize: MainAxisSize.max,
    //                             children: [
    //                               Image(
    //                                 height: 100,
    //                                 width: 100,
    //                                 image: NetworkImage(
    //                                     snapshot.data![index].image.toString()),
    //                               ),
    //                               SizedBox(
    //                                 width: 5,
    //                               ),
    //                               Expanded(
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.start,
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                   children: [
    //                                     Row(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Text(snapshot
    //                                             .data![index].productname
    //                                             .toString()),
    //                                         InkWell(
    //                                           onTap: (){
    //                                             dBhelper.delete(snapshot.data![index].id!);
    //                                             cart.removiecounter();
    //                                             cart.removetotalprice(double.parse(snapshot.data![index].productprice.toString()));
    //                                           },
    //                                           child: Icon(
    //                                             Icons.delete,
    //                                             color: Colors.black,
    //                                           ),
    //                                         )
    //                                       ],
    //                                     ),
    //                                     SizedBox(
    //                                       height: 5,
    //                                     ),
    //                                     // Text(snapshot.data![index].unittag
    //                                     //         .toString() +
    //                                     //     "   " +
    //                                     //     snapshot.data![index].productprice
    //                                     //         .toString()),
    //                                     InkWell(
    //                                       onTap: () {},
    //                                       child: Container(
    //                                         height: 35,
    //                                         width: 100,
    //                                         decoration: BoxDecoration(
    //                                             color: Colors.green),
    //                                         child: Center(
    //                                             child: Text("ADD TO CART")),
    //                                       ),
    //                                     )
    //                                   ],
    //                                 ),
    //                               )
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                     );
    //                   }),
    //             );
    //           }
    //           return Text("");
    //         },
    //       ),
    //       Consumer<CartProvider>(builder: (context, value, child) {
    //         return Column(
    //           children: [
    //             reusable(
    //                 title: 'Sub total',
    //                 value: r'$' + value.gettotalprice().toStringAsFixed(2))
    //           ],
    //         );
    //       })
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
                    "Your Cart",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
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
          FutureBuilder(
              future: cart.getData(),
              // builder: (context, AsyncSnapshot<List<Cart>>)
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      image[index][0].toString(),
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
                                      onTap: () {
                                        dBhelper
                                            .insert(Cart(
                                          id: int.parse(index.toString() + "0"),
                                          image: image[index][0].toString(),
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
                                      child: InkWell(
                                        onTap: () {
                                          dBhelper.delete(
                                              snapshot.data![index].id!);
                                          cart.removiecounter();
                                          cart.removetotalprice(double.parse(
                                              snapshot.data![index].productprice
                                                  .toString()));
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.orange,
                                        ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset(
                                      image[index][1].toString(),
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
                                      onTap: () {
                                        dBhelper
                                            .insert(Cart(
                                          id: int.parse(index.toString() + "1"),
                                          image: image[index][1].toString(),
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
                                      child: InkWell(
                                        onTap: () {
                                          dBhelper.delete(
                                              snapshot.data![index].id!);
                                          cart.removiecounter();
                                          cart.removetotalprice(double.parse(
                                              snapshot.data![index].productprice
                                                  .toString()));
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.orange,
                                        ),
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
                  ));
                }

                return Text("");
              }),
          Consumer<CartProvider>(builder: (context, value, child) {
            return Column(
              children: [
                reusable(
                    title: 'Sub total',
                    value: r'$' + value.gettotalprice().toStringAsFixed(2))
              ],
            );
          })
        ],
      ),
    );
  }
}

class reusable extends StatelessWidget {
  final String title, value;
  const reusable({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
          ),
          Text(value)
        ],
      ),
    );
  }
}
