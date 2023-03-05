import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_add_subtract_of_items/cartmodel.dart';
import 'package:testing_add_subtract_of_items/dbhelper.dart';

class CartProvider with ChangeNotifier{

  DBhelper dbxy = DBhelper();

  int _counter = 0;
  int get counter => _counter;

  double _totalprice = 0;
  double get totalprice => _totalprice;

  late Future<List<Cart>> _cart ;
  Future <List<Cart>> get cart=> _cart;

  Future <List<Cart>> getData() async{
    _cart = dbxy.getcartlist();
    return _cart;
  } 


  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalprice);
    notifyListeners();
  }


  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalprice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addcounter (){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removiecounter (){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getcounter () {
    _getPrefItems();
    return _counter;
  }

  void addtotalprice (double productprice){
    _totalprice += productprice;
    _setPrefItems();
    notifyListeners();
  }

  void removetotalprice (double productprice){
    _totalprice -= productprice;
    _setPrefItems();
    notifyListeners();
  }

  double gettotalprice () {
    _getPrefItems();
    return _totalprice;
  }

}