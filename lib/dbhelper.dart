import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'cartmodel.dart';

class DBhelper {
  static Database? _dby;

  Future<Database?> get dby async {
    if (_dby != null) {
      return _dby!;
    }

    _dby = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.dby');
    var dby = await openDatabase(path, version: 1, onCreate: _oncreate);
    return dby;
  }

  _oncreate(Database dby, int version) async {
    await dby.execute(
        'CREATE TABLE cart (id INTEGER ,productname TEXT, productprice INTEGER , quantity INTEGER , image TEXT )');
  }

  Future <Cart> insert(Cart cart) async{
    // print(cart.toMap());
    var dbyClient = await dby;
    await dbyClient!.insert('cart', cart.toMap());
    return cart;
  }
  Future <List<Cart>> getcartlist() async{
    var dbyClient = await dby;
    final List<Map<String, Object?>> queryResult = await dbyClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future <int> delete(int id) async{
    var dbyClient = await dby;
    return await dbyClient!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}
