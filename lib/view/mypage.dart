import 'package:chef_shop_lecture/controller/controller.dart';
import 'package:chef_shop_lecture/view/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
   MyPage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 16, 5,16),
          child: Obx(()=>GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                    return ProductTile(
                      product: controller.productList[index],
                    );
              },
              itemCount: controller.productList.length,
            ),
          ),
        )
        ),
      floatingActionButton: FloatingActionButton.extended(

        onPressed: (){},
        label: GetX<Controller>(
            builder: (controller) {
              return Text(
                'Item : ${controller.cartList.length.toString()}',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }
        ),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.redAccent,

      ),
      );
  }
}
