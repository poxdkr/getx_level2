import 'package:chef_shop_lecture/data/services.dart';
import 'package:chef_shop_lecture/model/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class Controller extends GetxController{
  var productList = <Product>[].obs;
  var cartList = <Product>[].obs;

  void fetchData() async {
    var products = await Services.fetchProduct();
    if(products !=null){
      productList.value = products;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void addCartList(Product product){
      cartList.add(product);
  }

}