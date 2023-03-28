import 'package:chef_shop_lecture/controller/controller.dart';
import 'package:chef_shop_lecture/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {

  var controller = Get.put(Controller());

  final Product product;
  ProductTile({
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: 40,
                width: 100,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  product.imageLink,
                  fit: BoxFit.fill,
                ),
              ),
              Obx(() => CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    icon: product.like.value ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_outline),
                    onPressed: () {
                      product.like.toggle();
                    },
                    iconSize: 18,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating!= null ? product.rating.toString() : '0.0',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                    controller.addCartList(product);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Add to Cart', style : TextStyle(color: Colors.white)),

                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '\$${product.price}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ]),
      ),
    );
  }
}