class Cart {
  late final int? id;
  // final String? productid;
  final String? productname;
  // final int? initialprice;
  final int? productprice;
  final int? quantity;
  // final String? unittag;
  final String? image;

  Cart({

    required this.id,
    // required this.initialprice,
    // required this.productid,
    required this.productname,
    required this.productprice,
    required this.quantity,
    // required this.unittag,
    required this.image,

  });

  Cart.fromMap(Map<dynamic, dynamic> res)
  : id = res['id'],
  // productid = res['productid'],
  productname = res['productname'],
  // initialprice = res['initialprice'],
  productprice = res['productprice'],
  quantity = res['quantity'],
  // unittag = res['unittag'],
  image = res['image'];

  Map<String, Object?> toMap(){
    return {
      'id' : id,
      // 'productid' : productid,
      'productname' : productname,
      // 'initialprice' : initialprice,
      'productprice' : productprice,
      'quantity' : quantity,
      // 'unittag' : unittag,
      'image' : image,
    };
  }
}